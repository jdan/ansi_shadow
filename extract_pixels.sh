#!/bin/bash
#
# Extract pixel art from Legend of Zelda katakana image
# This script provides a manual extraction guide since image libraries aren't available
#

cat << 'EOF'
PIXEL EXTRACTION GUIDE
======================

Since image processing libraries aren't available, here's a manual approach
to extract pixel data from the Legend of Zelda katakana image:

METHOD 1: Use an online tool
-----------------------------
1. Visit: https://www.dcode.fr/binary-image
2. Upload: /tmp/katakana_reference.png
3. Set threshold to detect dark pixels
4. Extract each character's pixel grid (8x7 pixels per character)
5. Convert to Ruby format (each pixel becomes ██)

METHOD 2: Use a local image viewer
-----------------------------------
1. Open the image in an image viewer with pixel grid
2. Zoom in to see individual pixels
3. Manually trace each 8x7 character cell
4. Note which pixels are filled (dark) vs empty (light)

METHOD 3: Character Grid Layout
--------------------------------
The left panel of the image contains a 5x10 grid of katakana:

Row 1: ア  イ  ウ  エ  オ   (A  I  U  E  O)
Row 2: カ  キ  ク  ケ  コ   (KA KI KU KE KO)
Row 3: サ  シ  ス  セ  ソ   (SA SHI SU SE SO)
Row 4: タ  チ  ツ  テ  ト   (TA CHI TSU TE TO)
Row 5: ナ  ニ  ヌ  ネ  ノ   (NA NI NU NE NO)
Row 6: ハ  ヒ  フ  ヘ  ホ   (HA HI FU HE HO)
Row 7: マ  ミ  ム  メ  モ   (MA MI MU ME MO)
Row 8: ヤ  (小) ユ  (小) ヨ  (YA XYA YU XYU YO)
Row 9: ラ  リ  ル  レ  ロ   (RA RI RU RE RO)
Row 10: ワ  ヲ  ン  ゛  ゜   (WA WO N DAKUTEN HANDAKUTEN)

Each character cell is approximately:
- Width: 8 pixels
- Height: 7 pixels
- Horizontal spacing: 9 pixels (8 char + 1 gap)
- Vertical spacing: 8 pixels (7 char + 1 gap)
- Grid starts at approximately: x=32, y=144

AUTOMATED EXTRACTION (requires dependencies)
--------------------------------------------
If you can install dependencies:

# For Python:
pip install Pillow
python3 extract_pixels.py /tmp/katakana_reference.png

# For Ruby:
gem install chunky_png
ruby extract_pixels.rb /tmp/katakana_reference.png

RUBY CODE FORMAT
----------------
Each character should be formatted as:

      A = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ████████
                ██
                ██
              ██████
            ████
            ██
          ████
      TEXT

Where each original pixel becomes ██ (two unicode block characters).

EOF

# Try to detect if we can use any available tools
echo ""
echo "Checking for available image tools..."
echo "======================================"

if command -v convert &> /dev/null; then
    echo "✓ ImageMagick found!"
    echo "  You can use: convert image.png -compress none ppm:- | less"
elif command -v ffmpeg &> /dev/null; then
    echo "✓ ffmpeg found!"
    echo "  You can use: ffmpeg -i image.png -f image2 -"
elif command -v python3 &> /dev/null; then
    echo "○ Python3 found (but PIL not installed)"
    echo "  Install: pip install Pillow"
elif command -v ruby &> /dev/null; then
    echo "○ Ruby found (but chunky_png not installed)"
    echo "  Install: gem install chunky_png"
else
    echo "✗ No image processing tools found"
fi

echo ""
echo "To extract pixels automatically, please install one of the above dependencies."
