#!/bin/sh
# Shiftability test: insert padding into an asm file, rebuild, and check that
# the shifted ROM plays exactly like the original in mGBA.
#
#   tools/emu/shift_test.sh [asm-file] [bytes]      (default: asm/game.s 52)
#
# Passes if the screens match from power-on to the race start AND the
# zinger-buzz reproduction behaves exactly as on the original ROM.
set -e
cd "$(dirname "$0")/../.."
FILE=${1:-asm/game.s}
BYTES=${2:-52}
mkdir -p build/emu
cp "$FILE" build/emu/shift_backup.s
trap 'cp build/emu/shift_backup.s "$FILE"; make -s >/dev/null 2>&1 || true' EXIT
printf '\t.space %d @ SHIFT TEST\n' "$BYTES" >> "$FILE"
make -s >/dev/null
cp dkp.gba build/emu/shifted.gba
echo "built shifted ROM: $BYTES bytes inserted at the end of $FILE"
python3 tools/emu/compare_boot.py baserom.gba build/emu/shifted.gba
python3 tools/emu/repro_zinger_buzz.py baserom.gba > build/emu/repro_orig.txt || true
python3 tools/emu/repro_zinger_buzz.py build/emu/shifted.gba > build/emu/repro_shifted.txt || true
if diff -q build/emu/repro_orig.txt build/emu/repro_shifted.txt >/dev/null 2>&1 ||
   [ "$(grep -v RESULT build/emu/repro_orig.txt)" = "$(grep -v RESULT build/emu/repro_shifted.txt)" ]; then
    echo "gameplay repro: identical events and sounds"
    echo "PASS"
else
    echo "gameplay repro differs:"; diff build/emu/repro_orig.txt build/emu/repro_shifted.txt || true
    echo "FAIL"; exit 1
fi
