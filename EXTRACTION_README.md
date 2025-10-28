# Katakana Pixel Art Extraction

This directory contains tools to extract pixel art from the Legend of Zelda katakana reference image.

## Scripts

### `extract_pixels.py`
Python script that automatically extracts katakana characters from the image and converts them to Ruby code format.

**Requirements:**
```bash
pip3 install Pillow
```

**Usage:**
```bash
python3 extract_pixels.py /path/to/katakana_image.png
```

### `extract_pixels.sh`
Shell script providing a manual extraction guide when Python/PIL is not available.

## Image Analysis Results

**Image:** Legend of Zelda name registration screen
**Source:** https://legendsoflocalization.com/media/the-legend-of-zelda/gameplay/register_name_comp.png

**Dimensions:** 513×240 pixels
**Format:** PNG with indexed color palette (7 colors)

### Katakana Grid (Left Panel)

**Grid Parameters:**
- Starting position: (40, 152)
- Character dimensions: 8×7 pixels
- Horizontal spacing: 24 pixels (8 char + 16 gap)
- Vertical spacing: 16 pixels (7 char + 9 gap)
- Columns: 5
- Rows: 6 (limited by image height)

**Characters Extracted:** (30 total)

| Row | Characters | Romaji |
|-----|------------|--------|
| 0 | ア イ ウ エ オ | A I U E O |
| 1 | カ キ ク ケ コ | KA KI KU KE KO |
| 2 | サ シ ス セ ソ | SA SHI SU SE SO |
| 3 | タ チ ツ テ ト | TA CHI TSU TE TO |
| 4 | ナ ニ ヌ ネ ノ | NA NI NU NE NO |
| 5 | ハ ヒ フ ヘ ホ | HA HI FU HE HO |

**Missing Characters** (not visible in this image):
- Row 6: MA MI MU ME MO
- Row 7: YA (XYA) YU (XYU) YO
- Row 8: RA RI RU RE RO
- Row 9: WA WO N (special chars)

These characters were manually transcribed from the actual game by visual inspection.

## Output Format

Each character is converted to Ruby code with double-width pixels:

```ruby
A = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
      ██
████████████
      ██
████████████
      ██
      ██
      ██
TEXT
```

## Color Mapping

The script converts non-black pixels to filled (█) characters:
- Background: RGB(0, 0, 0) - black
- Characters: Any pixel with R>10 OR G>10 OR B>10

Common character colors in the image:
- White: RGB(255, 255, 255)
- Blue: RGB(75, 74, 255)
- Yellow/Gold: RGB(232, 165, 40)
- Green: RGB(148, 218, 0)

## Manual Verification

While automated extraction works well, manual verification is recommended to ensure:
1. No pixels are clipped at character boundaries
2. Characters with thin strokes are accurately captured
3. Special characters and diacritical marks are complete

Compare extracted output with the manual implementation in `lib/ansi_shadow/font/katakana.rb`.
