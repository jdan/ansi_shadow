# frozen_string_literal: true

module AnsiShadow
  module Font
    ##
    # 8x7 Katakana gylphs for ANSI Shadow font
    #
    # Inspired by the sprites found in Pokémon Blue (JP)
    # rubocop:disable Metrics/ModuleLength
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

      KA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ████
        ████████████████
            ████    ████
            ████    ████
          ████      ████
          ████      ████
        ████      ████
      TEXT

      KI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ████
        ████████████
        ████████████
            ████
        ████████████
        ████████████
            ████
      TEXT

      KU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ██
            ████████████
          ████      ████
        ████        ████
                    ████
                  ████
                ████
      TEXT

      KE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ████
            ████████████
          ████    ████
        ████      ████
                  ████
                ████
              ████
      TEXT

      KO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████
                ████
                ████
                ████
                ████
                ████
        ████████████
      TEXT

      SA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ████    ████
        ████████████████
          ████    ████
          ████    ████
                  ████
                ████
              ████
      TEXT

      SHI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██████
                  ████
        ██████    ████
                  ████
                  ████
                ████
          ████████
      TEXT

      SU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████████
                    ████
                  ████
                ████
              ██████
            ████  ████
        ██████      ████
      TEXT

      SE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ██
        ██████████████
          ██      ████
          ██    ████
          ██
          ████
            ██████████
      TEXT

      SO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████        ██
        ████      ████
          ████    ████
                ████
              ████
          ██████
        ████
      TEXT

      TA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ████
          ██████████████
        ████        ████
              ████  ████
                ████████
                  ████
              ██████
      TEXT

      CHI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                  ████
          ██████████
              ████
        ████████████████
              ████
              ████
          ██████
      TEXT

      TSU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██  ██    ████
        ██  ██    ████
        ██  ██    ████
                  ████
                  ████
                ████
            ██████
      TEXT

      TE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ██████████

        ██████████████
              ██
              ██
            ████
          ████
      TEXT

      TO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██
        ██
        ██████
        ██  ████
        ██    ████
        ██      ██
        ██
      TEXT

      NA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                ████
        ████████████████
                ████
                ████
                ████
              ████
            ████
      TEXT

      NI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp

          ██████████



        ██████████████
      TEXT

      NU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██████████████
                    ██
            ██    ████
            ██  ████
              ████
            ████  ██
          ████    ██
      TEXT

      NE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████
                  ██
                ████
              ████
          ██████████
        ████  ██  ████
        ██    ██    ██
      TEXT

      NO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                  ██
                  ██
                ████
                ██
              ████
            ████
        ██████
      TEXT

      HA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ██  ██
            ██  ██
          ████  ████
          ██      ██
        ████      ████
        ██          ██
        ██          ██
      TEXT

      HI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██
        ██    ██████
        ████████
        ██
        ██
        ████
          ██████████
      TEXT

      HU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██████████████
                  ████
                  ████
                ████
                ████
              ████
          ██████
      TEXT

      HE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp

            ████
          ████████
          ██    ████
        ████      ████
        ██          ████

      TEXT

      HO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
              ██
        ██████████████
              ██
          ██  ██  ██
        ████  ██  ████
        ██    ██    ██
            ████
      TEXT

      MA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████████
                    ████
          ██      ████
          ████  ████
            ██████
              ████
                ████
      TEXT

      MI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████
            ████████

          ████████

        ████████
            ████████
      TEXT

      MU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
              ██
            ████
            ██
          ████    ██
          ██      ██
          ██  ████████
        ████████    ██
      TEXT

      ME = AnsiShadow::Glyph.from_mono <<~TEXT.chomp

                    ██
            ██      ██
              ██  ██
                ██
            ████████
        ██████      ██
      TEXT

      MO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ██████████
            ██
        ██████████████
            ██
            ██
            ██
              ██████
      TEXT

      YA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ██
        ██████████████
            ██    ████
            ██  ████
            ██
            ██
            ██
      TEXT

      YU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp

          ████████
                ██
                ██
                ██
                ██
        ████████████
      TEXT

      YO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████
                  ██
                  ██
          ██████████
                  ██
                  ██
        ████████████
      TEXT
    end
  end
  # rubocop:enable Metrics/ModuleLength
end
