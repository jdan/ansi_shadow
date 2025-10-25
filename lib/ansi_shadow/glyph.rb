# frozen_string_literal: true

module AnsiShadow
  ##
  # Represents an individual character or "glyph" of text
  class Glyph
    ##
    # @param [String]
    def initialize(monocolor_str)
      @grid = []
      monocolor_str.lines.each do |line|
        @grid << line.chomp.chars.map { |c| (/\s/ =~ c).nil? }
      end
    end

    def to_s
      @grid.map do |row|
        row.map { |character| character ? "█" : " " }.join ""
      end.join "\n"
    end
  end
end
