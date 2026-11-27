#!/bin/sh
# Regenerate all asm/, data/, ld_script.ld and objects.mk from baserom.gba.
# WARNING: this overwrites hand edits in asm/ and data/.
set -e
cd "$(dirname "$0")/.."
mkdir -p build
python3 tools/analyze.py baserom.gba config/dkp.cfg build/db.json
python3 tools/find_names.py baserom.gba build/db.json > build/names.json
python3 tools/find_assets.py baserom.gba build/db.json config/dkp.cfg > config/assets.txt
rm -f asm/*.s data/*.s
python3 tools/gen_asm.py baserom.gba build/db.json config/dkp.cfg .
