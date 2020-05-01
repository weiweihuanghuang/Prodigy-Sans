#!/bin/bash
set -e

glyphsSource="ProdigySans.glyphs ProdigySans-Italic.glyphs"

mkdir -p ../fonts/ ../fonts/webfonts/TTF ../fonts/variable ../fonts/webfonts/WOFF ../fonts/webfonts/WOFF2

# Generate TTFs
TTF_OUT=../fonts/webfonts/TTF
fontmake -g ProdigySans.glyphs -o ttf -i --output-dir $TTF_OUT
fontmake -g ProdigySans-Italic.glyphs -o ttf -i --output-dir $TTF_OUT

for ttf in ../fonts/webfonts/TTF/*.ttf
do
  ttfautohint $ttf $ttf.fix
  mv $ttf.fix $ttf
  gftools fix-dsig -f $ttf
  python tools/gftools-fix-hinting.py $ttf
  mv $ttf.fix $ttf
done

# Generate woff
for ttf in ../fonts/webfonts/TTF/*.ttf
do
  sfnt2woff-zopfli $ttf
  mv ${ttf/.ttf/.woff} ../fonts/webfonts/WOFF
done

# Generate woff2
for ttf in ../fonts/webfonts/TTF/*.ttf
do
  woff2_compress $ttf
  mv ${ttf/.ttf/.woff2} ../fonts/webfonts/WOFF2
done

rm -rf master_ufo/ instance_ufo/