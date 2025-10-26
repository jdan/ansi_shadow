# frozen_string_literal: true

module AnsiShadow
  ##
  # Renders text from an input string
  class Text
    def initialize(glyphs)
      @glyphs = glyphs
    end

    def to_s
      @glyphs.inject { |text, glyph| text.beside(glyph, spacing: 2) }.to_s
    end

    def shadow
      Text.new(@glyphs.map(&:shadow))
    end

    class << self
      def from_str(str)
        glyphs = str.chars.map { |char| Font::Katakana::KANA_MAP[char.to_sym] }
        Text.new glyphs
      end
    end
  end
end
