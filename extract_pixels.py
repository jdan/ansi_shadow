#!/usr/bin/env python3
"""
Extract pixel art from Legend of Zelda katakana image
and convert to Ruby code format.
"""

from PIL import Image
import sys

class PixelExtractor:
    def __init__(self, image_path):
        self.image = Image.open(image_path)

        # Convert palette/indexed images to RGB
        if self.image.mode == 'P':
            self.image = self.image.convert('RGB')
        elif self.image.mode not in ('RGB', 'RGBA', 'L'):
            self.image = self.image.convert('RGB')

        self.width, self.height = self.image.size
        self.pixels = self.image.load()

    def analyze(self):
        """Analyze image to find colors and dimensions."""
        print(f"Image dimensions: {self.width}x{self.height}")

        # Find unique colors
        colors = {}
        for y in range(self.height):
            for x in range(self.width):
                color = self.pixels[x, y]
                colors[color] = colors.get(color, 0) + 1

        print(f"\nUnique colors found: {len(colors)}")
        for color, count in sorted(colors.items(), key=lambda x: -x[1])[:10]:
            print(f"  {color}: {count} pixels")

    def is_filled(self, x, y, threshold=128):
        """Check if a pixel is filled (character pixel) or background."""
        if x >= self.width or y >= self.height or x < 0 or y < 0:
            return False

        pixel = self.pixels[x, y]

        # Handle different pixel formats
        if isinstance(pixel, int):
            # Grayscale or indexed color
            return pixel > threshold
        elif len(pixel) >= 3:
            # RGB or RGBA
            r, g, b = pixel[0], pixel[1], pixel[2]

            # Black background (0,0,0) - most common
            # Character pixels are lighter (white or colored)
            # Consider pixel filled if it's NOT black
            return r > 10 or g > 10 or b > 10

        return False

    def extract_character(self, x_start, y_start, char_width, char_height):
        """Extract a character as a 2D array of pixels."""
        pixels = []

        for y in range(char_height):
            row = []
            for x in range(char_width):
                pixel_x = x_start + x
                pixel_y = y_start + y

                if self.is_filled(pixel_x, pixel_y):
                    row.append('█')
                else:
                    row.append(' ')
            pixels.append(row)

        return pixels

    def visualize_character(self, pixels):
        """Print character to console."""
        for row in pixels:
            print(''.join(row))

    def to_ruby_code(self, pixels, var_name):
        """Convert pixel array to Ruby code format."""
        code = f"      {var_name} = AnsiShadow::Glyph.from_mono <<~TEXT.chomp\n"

        for row in pixels:
            # Convert single blocks to double blocks
            line = ''.join('██' if p == '█' else '  ' for p in row)
            code += f"      {line.rstrip()}\n"

        code += "      TEXT\n"
        return code

    def find_character_grid(self):
        """Find the katakana character grid in the image."""
        # The left panel contains the katakana grid
        # Looking at the image, characters appear around x=32 onwards

        # Find the first dark pixel to locate the grid
        for y in range(self.height):
            for x in range(20, 100):
                if self.is_filled(x, y):
                    print(f"First filled pixel found at ({x}, {y})")
                    return x, y

        return None, None

    def extract_all_katakana(self):
        """Extract all katakana characters from the grid."""
        # Katakana order in the Zelda grid (5 columns x 10 rows)
        katakana_labels = [
            'A',  'I',  'U',  'E',  'O',
            'KA', 'KI', 'KU', 'KE', 'KO',
            'SA', 'SHI', 'SU', 'SE', 'SO',
            'TA', 'CHI', 'TSU', 'TE', 'TO',
            'NA', 'NI', 'NU', 'NE', 'NO',
            'HA', 'HI', 'FU', 'HE', 'HO',
            'MA', 'MI', 'MU', 'ME', 'MO',
            'YA', 'XYA',  'YU', 'XYU',  'YO',
            'RA', 'RI', 'RU', 'RE', 'RO',
            'WA', 'WO', 'N',  'DASH',  'XTSU',
        ]

        # Character cell dimensions (based on testing)
        cell_width = 8
        cell_height = 7

        # Grid starting position (left panel katakana grid)
        grid_x = 40
        grid_y = 152

        # Spacing between characters (includes character + gap)
        x_spacing = 24
        y_spacing = 16

        results = {}

        for idx, label in enumerate(katakana_labels):
            if label == '?':
                continue

            row = idx // 5
            col = idx % 5

            x = grid_x + (col * x_spacing)
            y = grid_y + (row * y_spacing)

            pixels = self.extract_character(x, y, cell_width, cell_height)
            results[label] = pixels

        return results


def main():
    image_path = sys.argv[1] if len(sys.argv) > 1 else '/tmp/katakana_reference.png'

    try:
        extractor = PixelExtractor(image_path)
    except FileNotFoundError:
        print(f"Error: Image file not found: {image_path}")
        sys.exit(1)

    print("Analyzing image...")
    extractor.analyze()

    print("\n" + "=" * 60)
    print("Finding character grid...")
    print("=" * 60)

    grid_x, grid_y = extractor.find_character_grid()
    if grid_x is not None:
        print(f"Grid likely starts around ({grid_x}, {grid_y})")

    # Extract a sample character to verify
    print("\n" + "=" * 60)
    print("Extracting sample character (A/ア) at (40, 152) - 8x7 pixels")
    print("=" * 60)

    sample = extractor.extract_character(40, 152, 8, 7)
    print("\nVisual preview:")
    extractor.visualize_character(sample)

    print("\nRuby code format:")
    print(extractor.to_ruby_code(sample, 'A'))

    # Ask if user wants to extract all characters
    print("\n" + "=" * 60)
    print("Extract all katakana characters? (y/n)")
    response = input().strip().lower()

    if response == 'y':
        print("\nExtracting all characters...")
        all_chars = extractor.extract_all_katakana()

        for label, pixels in all_chars.items():
            print(f"\n{label}:")
            print(extractor.to_ruby_code(pixels, label))


if __name__ == '__main__':
    main()
