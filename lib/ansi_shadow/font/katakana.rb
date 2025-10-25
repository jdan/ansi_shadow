# frozen_string_literal: true

module AnsiShadow
  module Font
    ##
    # 8x7 Katakana gylphs for ANSI Shadow font
    #
    # Inspired by the sprites found in Pokémon Blue (JP)
    module Katakana
      A = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████████
            ████    ████
            ████    ████
            ████  ████
            ████
            ████
          ████
      TEXT

      I = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                    ████
                  ████
                ████
            ██████
        ██████  ██
                ██
                ██
      TEXT

      U = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
              ████
        ████████████████
        ████        ████
                    ████
                  ████
                  ████
              ██████
      TEXT

      E = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ████████████
          ████████████
              ████
              ████
              ████
        ████████████████
        ████████████████
      TEXT

      O = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                  ██
        ████████████████
              ██████
            ████  ██
          ████    ██
        ████      ██
                ████
      TEXT
    end
  end
end
