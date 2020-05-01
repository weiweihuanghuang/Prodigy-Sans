## Building Webfonts
Fonts are built using fontmake, gftools and Bramstein's webfonttools. These can be installed in a python virtualenv using the following commands:

```
# Create a new vitualenv
python3 -m venv venv
# Activate virtualenv
source venv/bin/activate
# Install python dependencies
pip install -r ../requirements.txt
# Install webfonttools
brew tap bramstein/webfonttools
brew install woff2
brew install sfnt2woff-zopfli
```

After installing the dependencies. Run `sh build.sh` from this directory to build the fonts.

## Buliding Desktop OTF Fonts
There are 2 sets of instances in the .glyphs files: the first set that are already activated which have the "Save as TrueType" custiom parameters are for webfonts. 

The second set are for OTF desktop fonts where veritcal metrics optimised for desktop apps such as Word, Adobe programs, etc. These are generated with the 'Remove Overlap' and 'Autohint' in Glyphs App.