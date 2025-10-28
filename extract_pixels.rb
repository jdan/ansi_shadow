#!/usr/bin/env ruby
# frozen_string_literal: true

require 'chunky_png'

# Extract pixel art from Legend of Zelda katakana image
class PixelExtractor
  def initialize(image_path)
    @image = ChunkyPNG::Image.from_file(image_path)
    @width = @image.width
    @height = @image.height
  end

  def analyze
    puts "Image dimensions: #{@width}x#{@height}"

    # Find all unique colors
    colors = {}
    @image.height.times do |y|
      @image.width.times do |x|
        color = @image[x, y]
        colors[color] ||= 0
        colors[color] += 1
      end
    end

    puts "\nUnique colors found: #{colors.size}"
    colors.sort_by { |_, count| -count }.each do |color, count|
      r = ChunkyPNG::Color.r(color)
      g = ChunkyPNG::Color.g(color)
      b = ChunkyPNG::Color.b(color)
      a = ChunkyPNG::Color.a(color)
      puts "  RGB(#{r},#{g},#{b},#{a}): #{count} pixels"
    end
  end

  def extract_character(x_start, y_start, char_width, char_height)
    pixels = []

    char_height.times do |y|
      row = []
      char_width.times do |x|
        pixel_x = x_start + x
        pixel_y = y_start + y

        if pixel_x >= @width || pixel_y >= @height
          row << ' '
          next
        end

        color = @image[pixel_x, pixel_y]

        # Check if pixel is "filled" (not background)
        # Assuming dark colors are filled, light colors are background
        luminance = ChunkyPNG::Color.r(color) +
                   ChunkyPNG::Color.g(color) +
                   ChunkyPNG::Color.b(color)

        # If it's dark (low luminance), it's a filled pixel
        row << (luminance < 384 ? '█' : ' ')
      end
      pixels << row
    end

    pixels
  end

  def to_ruby_code(pixels, var_name)
    code = "      #{var_name} = AnsiShadow::Glyph.from_mono <<~TEXT.chomp\n"

    pixels.each do |row|
      # Convert single blocks to double blocks
      line = row.map { |p| p == '█' ? '██' : '  ' }.join
      code += "      #{line.rstrip}\n"
    end

    code += "      TEXT\n"
    code
  end

  def extract_grid(grid_x, grid_y, cell_width, cell_height, cols, rows, labels)
    results = {}

    rows.times do |row|
      cols.times do |col|
        idx = row * cols + col
        break if idx >= labels.size

        label = labels[idx]
        x = grid_x + (col * cell_width)
        y = grid_y + (row * cell_height)

        pixels = extract_character(x, y, cell_width, cell_height)
        results[label] = pixels
      end
    end

    results
  end

  def visualize_character(pixels)
    pixels.each do |row|
      puts row.join
    end
  end
end

if __FILE__ == $0
  image_path = ARGV[0] || '/tmp/katakana_reference.png'

  unless File.exist?(image_path)
    puts "Error: Image file not found: #{image_path}"
    exit 1
  end

  extractor = PixelExtractor.new(image_path)
  extractor.analyze

  puts "\n" + "=" * 60
  puts "Extracting character grid from left panel..."
  puts "=" * 60

  # Based on the image, the katakana characters appear to be in a grid
  # Each character is approximately 8x8 pixels
  # Let me extract a sample character to verify

  # The left panel shows the katakana grid
  # Starting around x=32, y=144 based on visual inspection

  puts "\nExtracting sample character (A/ア) to determine cell size..."

  # Try to find the first character
  sample = extractor.extract_character(32, 144, 8, 7)
  puts "\nSample character (8x7):"
  extractor.visualize_character(sample)

  puts "\nGenerated Ruby code:"
  puts extractor.to_ruby_code(sample, 'A')
end
