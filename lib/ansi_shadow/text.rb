# frozen_string_literal: true

module AnsiShadow
  ##
  # Renders text from an input string
  class Text
    def initialize(glyphs)
      @glyphs = glyphs
    end

    ##
    # Converts the text to a string by placing all glyphs next to each other
    # @return [String]
    def to_s
      @glyphs.inject { |text, glyph| text.beside(glyph, spacing: 2) }.to_s
    end

    ##
    # Returns a new Text instance with shadowed glyphs
    # @return [Text] a new text instance with shadow effect applied
    def shadow
      Text.new(@glyphs.map(&:shadow))
    end

    class << self
      ##
      # Creates a Text instance from a plain Ruby string
      #
      # @param str [String] the input string to convert to text
      # @return [Text]
      def from_str(str)
        glyphs = str.chars.map { |char| Font::Katakana::KANA_MAP[char.to_sym] }
        Text.new glyphs
      end
    end
  end
end
