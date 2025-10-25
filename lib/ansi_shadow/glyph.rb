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

    def to_s
      @grid.map(&:join).join "\n"
    end

    ##
    # Returns the pixel at (px_x, px_y), or nil if it
    # is out of bounds
    #
    # @param [number] px_x
    # @param [number] px_y
    def pixel(px_x, px_y)
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
    # @param [Glyph] The other glyph
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

    class << self
      ##
      # Converts a monocolor string into a glyph
      # @param [String]
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
    # "Stacks" a pixel on top of another
    #
    # @param [String, nil] px1
    # @param [String, nil] px2
    def stack_pixel(px1, px2)
      if px1.nil? || /\s/ =~ px1
        px2
      else
        px1
      end
    end
  end
end
