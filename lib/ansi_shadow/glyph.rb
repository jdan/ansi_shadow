# frozen_string_literal: true

module AnsiShadow
  ##
  # Represents an individual character or "glyph" of text
  class Glyph
    ##
    # @param [Array[String]]
    def initialize(grid)
      @grid = grid
    end

    def to_s
      @grid.map(&:join).join "\n"
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
  end
end
