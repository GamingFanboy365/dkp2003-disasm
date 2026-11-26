// Headless mGBA driver for Diddy Kong Pilot experiments.
#include <mgba/flags.h>
// Usage: dkprun rom.gba < script
// Script commands (one per line, '#' comments):
//   load <file>            load savestate
//   save <file>            save savestate
//   run <frames> [keys]    run frames holding keys (A,B,L,R,UP,DOWN,LEFT,RIGHT,START,SELECT joined by '+')
//   tap <keys> [hold] [gap] press keys for hold frames (default 4) then release for gap frames (default 8)
//   shot <file.png>        screenshot
//   peek <addr> [n]        print n 32-bit words
//   poke <addr> <val>      write 32-bit word
//   vlog <file>|off        per-frame log of gamesfx voice/pending tables
//   echo <text>
#include <mgba-util/common.h>
#include <mgba/core/core.h>
#include <mgba/core/serialize.h>
#include <mgba/core/config.h>
#include <mgba/gba/core.h>
#include <mgba-util/vfs.h>
#include <mgba-util/image.h>
#include <mgba/core/log.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

static struct mCore* core;
static mColor* vbuf;
static FILE* vlog;
static unsigned long frameno;

static uint32_t parse_keys(const char* s) {
	static const char* names[] = {"A","B","SELECT","START","RIGHT","LEFT","UP","DOWN","R","L"};
	uint32_t k = 0;
	char buf[256];
	if (!s) return 0;
	strncpy(buf, s, sizeof(buf) - 1); buf[sizeof(buf) - 1] = 0;
	for (char* t = strtok(buf, "+"); t; t = strtok(NULL, "+")) {
		for (int i = 0; i < 10; ++i) if (!strcmp(t, names[i])) k |= 1u << i;
	}
	return k;
}

static uint32_t r32(uint32_t a) { return core->busRead32(core, a); }

static void log_frame(void) {
	if (!vlog) return;
	// 4 hardware voices at 0x0202DECC, stride 0x30
	fprintf(vlog, "%lu", frameno);
	for (int v = 0; v < 4; ++v) {
		uint32_t b = 0x0202DECC + v * 0x30;
		fprintf(vlog, " | v%d a=%u id=%u snd=%u fl=%x cb=%x ctx=%x", v, r32(b + 0x14), r32(b + 4), r32(b + 8),
		        r32(b + 0x18), r32(b + 0x28), r32(b + 0x2c));
	}
	// pending list
	int n = 0;
	for (uint32_t p = r32(0x0202E38C); p && n < 16; p = r32(p + 4), ++n) {
		fprintf(vlog, " | P id=%u snd=%u ttl=%d", r32(p + 0xc), r32(p + 0x10), (int) r32(p + 0x24));
	}
	fprintf(vlog, "\n");
}

static void frame(uint32_t keys) {
	core->setKeys(core, keys);
	core->runFrame(core);
	++frameno;
	log_frame();
}

static int logOn;
static void noLog(struct mLogger* l, int category, enum mLogLevel level, const char* format, va_list args) {
	(void) l; (void) category; (void) level;
	if (!logOn) return;
	vfprintf(stderr, format, args);
	fputc('\n', stderr);
}
static struct mLogger nullLogger = { .log = noLog };

int main(int argc, char** argv) {
	mLogSetDefaultLogger(&nullLogger);
	if (argc < 2) { fprintf(stderr, "usage: %s rom\n", argv[0]); return 1; }
	core = GBACoreCreate();
	core->init(core);
	mCoreInitConfig(core, NULL);
	unsigned w, h;
	core->baseVideoSize(core, &w, &h);
	vbuf = calloc(w * h, sizeof(mColor));
	core->setVideoBuffer(core, vbuf, w);
	core->setAudioBufferSize(core, 2048);
	if (!mCoreLoadFile(core, argv[1])) { fprintf(stderr, "load failed\n"); return 1; }
	core->reset(core);
	char line[512];
	while (fgets(line, sizeof(line), stdin)) {
		char* c = strchr(line, '#'); if (c) *c = 0;
		char cmd[64] = {0}, a1[256] = {0}, a2[256] = {0}, a3[256] = {0};
		int n = sscanf(line, "%63s %255s %255s %255s", cmd, a1, a2, a3);
		if (n <= 0) continue;
		if (!strcmp(cmd, "run")) {
			int f = atoi(a1); uint32_t k = n > 2 ? parse_keys(a2) : 0;
			for (int i = 0; i < f; ++i) frame(k);
		} else if (!strcmp(cmd, "tap")) {
			uint32_t k = parse_keys(a1); int hold = n > 2 ? atoi(a2) : 4, gap = n > 3 ? atoi(a3) : 8;
			for (int i = 0; i < hold; ++i) frame(k);
			for (int i = 0; i < gap; ++i) frame(0);
		} else if (!strcmp(cmd, "shot")) {
			struct mImage* img = mImageCreateFromConstBuffer(w, h, w, mCOLOR_NATIVE, vbuf);
			if (!mImageSave(img, a1, "png")) fprintf(stderr, "shot failed\n");
			mImageDestroy(img);
		} else if (!strcmp(cmd, "save")) {
			struct VFile* vf = VFileOpen(a1, O_CREAT | O_TRUNC | O_RDWR);
			mCoreSaveStateNamed(core, vf, SAVESTATE_SAVEDATA | SAVESTATE_RTC | SAVESTATE_METADATA);
			vf->close(vf);
		} else if (!strcmp(cmd, "load")) {
			struct VFile* vf = VFileOpen(a1, O_RDONLY);
			if (!vf || !mCoreLoadStateNamed(core, vf, SAVESTATE_SAVEDATA | SAVESTATE_RTC)) fprintf(stderr, "loadstate failed\n");
			if (vf) vf->close(vf);
		} else if (!strcmp(cmd, "peek")) {
			uint32_t a = strtoul(a1, 0, 0); int cnt = n > 2 ? atoi(a2) : 1;
			printf("%08x:", a);
			for (int i = 0; i < cnt; ++i) printf(" %08x", r32(a + 4 * i));
			printf("\n");
		} else if (!strcmp(cmd, "poke")) {
			core->busWrite32(core, strtoul(a1, 0, 0), strtoul(a2, 0, 0));
		} else if (!strcmp(cmd, "vlog")) {
			if (vlog) fclose(vlog), vlog = NULL;
			if (strcmp(a1, "off")) vlog = fopen(a1, "w");
		} else if (!strcmp(cmd, "dumpmem")) {
			// dumpmem <file> : write EWRAM (256K) + IWRAM (32K)
			FILE* f = fopen(a1, "wb");
			for (uint32_t a = 0x02000000; a < 0x02040000; a += 4) { uint32_t v = r32(a); fwrite(&v, 4, 1, f); }
			for (uint32_t a = 0x03000000; a < 0x03008000; a += 4) { uint32_t v = r32(a); fwrite(&v, 4, 1, f); }
			fclose(f);
		} else if (!strcmp(cmd, "regs")) {
			static const char* rn[] = {"r0","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12","sp","lr","pc","cpsr"};
			for (int i = 0; i < 17; ++i) {
				int32_t v = 0;
				core->readRegister(core, rn[i], &v);
				printf("%s=%08x%c", rn[i], (uint32_t) v, i == 16 ? '\n' : ' ');
			}
		} else if (!strcmp(cmd, "step")) {
			// step <n>: execute n CPU instructions, printing pc each time
			int cnt = atoi(a1);
			for (int i = 0; i < cnt; ++i) {
				core->step(core);
				int32_t v = 0;
				core->readRegister(core, "pc", &v);
				printf("%08x\n", (uint32_t) v);
			}
		} else if (!strcmp(cmd, "until")) {
			// until <pc> [maxinsns]: single-step until pc == addr
			uint32_t want = strtoul(a1, 0, 0);
			long max = n > 2 ? atol(a2) : 50000000L;
			long i;
			for (i = 0; i < max; ++i) {
				core->step(core);
				int32_t v = 0;
				core->readRegister(core, "pc", &v);
				if (((uint32_t) v & ~1u) == (want & ~1u)) break;
			}
			printf("until: %s after %ld insns\n", i < max ? "hit" : "timeout", i);
		} else if (!strcmp(cmd, "str")) {
			// str <addr>: print C string
			uint32_t a = strtoul(a1, 0, 0);
			for (int i = 0; i < 200; ++i) { int ch = core->busRead8(core, a + i); if (!ch) break; putchar(ch >= 32 && ch < 127 ? ch : '.'); }
			putchar('\n');
		} else if (!strcmp(cmd, "log")) {
			logOn = !strcmp(a1, "on");
		} else if (!strcmp(cmd, "trace")) {
			// trace <file> <ninsns>: single-step, writing pc, r0, r1, r2, r3, r12 of each instruction as binary uint32s
			FILE* tf = fopen(a1, "wb");
			long cnt = atol(a2);
			for (long i = 0; i < cnt; ++i) {
				static const char* tr[] = {"pc", "r0", "r1", "r2", "r3", "r12"};
				int32_t v[6] = {0};
				for (int k = 0; k < 6; ++k) core->readRegister(core, tr[k], &v[k]);
				fwrite(v, 4, 6, tf);
				core->step(core);
			}
			fclose(tf);
		} else if (!strcmp(cmd, "echo")) {
			printf("%s", line + 5);
		}
		fflush(stdout);
	}
	if (vlog) fclose(vlog);
	core->deinit(core);
	return 0;
}
