# frozen_string_literal: true

module AnsiShadow
  ##
  # Represents an individual character or "glyph" of text
  class Glyph
    ##
    # @param [Array<String>] grid
    def initialize(grid)
      @grid = grid
    end

    ##
    # @return [String]
    def to_s
      @grid.map do |row|
        # NOTE: Trim trailing white space from each row for consistency
        row.join("").rstrip
      end.join "\n"
    end

    ##
    # Returns the pixel at (px_x, px_y), or nil if it
    # is out of bounds
    #
    # @param [number] px_x
    # @param [number] px_y
    def pixel(px_x, px_y)
      # NOTE: In ruby, arr[-1] is the last element of the row, so we
      # include an explicit check to reduce footguns
      return nil if px_x.negative? || px_y.negative?

      @grid[px_y] && @grid[px_y][px_x]
    end

    ##
    # Returns the width of the glyph, which is the
    # max length of all rows
    def width
      @grid.map(&:size).max
    end

    ##
    # Returns the height of the glyph
    def height
      @grid.size
    end

    ##
    # Stacks this glyph on top of another, and returns
    # the result as a new Glyph
    #
    # @param [Glyph] other_glyph The other glyph
    # @return [Glyph]
    def atop(other_glyph)
      grid = []
      [height, other_glyph.height].max.times do |y|
        row = []
        [width, other_glyph.width].max.times do |x|
          row << stack_pixel(pixel(x, y), other_glyph.pixel(x, y))
        end
        grid << row
      end

      Glyph.new grid
    end

    ##
    # Adds a shadow to the glyph
    # @return [Glyph]
    def shadow
      grid = []
      (height + 1).times do |y|
        row = []
        (width + 1).times do |x|
          row << shadow_at(x, y)
        end
        grid << row
      end

      shadow = Glyph.new(grid)
      atop(shadow)
    end

    ##
    # Returns the "shadow character" at (x, y), based on the characters around it
    # @param [Integer] px_x The x coordinate
    # @param [Integer] px_y The y coordinate
    # @return [String]
    # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
    def shadow_at(px_x, px_y)
      case [
        pixel(px_x - 1, px_y),
        pixel(px_x - 1, px_y - 1),
        pixel(px_x, px_y - 1)
      ].map { |px| px_empty?(px) }

      # [LEFT, ABOVE_LEFT, ABOVE]
      when [true, true, true]
        " "
      when [true, true, false]
        "╚"
      when [true, false, true]
        "╝"
      when [true, false, false]
        "═"
      when [false, true, true]
        "╗"
      when [false, true, false]
        "╬"
      when [false, false, true]
        "║"
      when [false, false, false]
        "╔"
      end
    end
    # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

    class << self
      ##
      # Converts a monocolor string into a glyph
      # @param [String] str
      # @return [Glyph]
      def from_mono(str)
        grid = []
        str.lines.each do |line|
          grid << line.chomp.chars.map { |c| /\s/ =~ c ? " " : "█" }
        end

        Glyph.new grid
      end
    end

    private

    ##
    # Determines if a pixel is "empty" (nil or whitespace)
    #
    # @param [String, nil] pixel
    # @return [Boolean]
    def px_empty?(pixel)
      pixel.nil? || !(/\s/ =~ pixel).nil?
    end

    ##
    # "Stacks" a pixel on top of another
    #
    # @param [String, nil] px1
    # @param [String, nil] px2
    # @return [String, nil]
    def stack_pixel(px1, px2)
      if px_empty?(px1)
        px2
      else
        px1
      end
    end
  end
end
