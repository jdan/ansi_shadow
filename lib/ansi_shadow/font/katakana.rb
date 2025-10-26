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
          ████     ███
        ████       ███
                   ███
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
        ██          ██
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
        ████         ███
              ████   ███
                ████ ███
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
        ██    ██
        ██
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

      FU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
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

      RA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          ████████████

        ████████████████
                      ██
                    ████
                  ████
              ██████
      TEXT

      RI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██        ██
        ██        ██
        ██        ██
        ██        ██
                ████
              ████
          ██████
      TEXT

      RU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
            ██  ██
            ██  ██
            ██  ██
            ██  ██
            ██  ██    ██
            ██  ██  ████
        ████    ██████
      TEXT

      RE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ██
        ██
        ██          ██
        ██        ████
        ██      ████
        ██  ██████
        ██████
      TEXT

      RO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████
        ██        ██
        ██        ██
        ██        ██
        ██        ██
        ██        ██
        ████████████
      TEXT

      WA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████████
        ██          ████
        ██          ████
                  ████
                  ████
                ████
            ██████
      TEXT

      WO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ████████████████
                    ████
                    ████
          ████████████
                  ████
                ████
            ██████
      TEXT

      N = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
                    ██
        ███       ████
           ███    ████
                ████
              ████
          ██████
        ████
      TEXT

      DASH = AnsiShadow::Glyph.from_mono <<~TEXT.chomp



        ████████████




      TEXT

      XTSU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp



        ██  ██  ██
        ██  ██  ██
                ██
            ████
      TEXT

      XYA = AnsiShadow::Glyph.from_mono <<~TEXT.chomp


          ██
        ██████████
          ██    ██
          ██  ██
          ██
      TEXT

      XI = AnsiShadow::Glyph.from_mono <<~TEXT.chomp


              ██
            ██
        ██████
            ██
            ██
      TEXT

      XYU = AnsiShadow::Glyph.from_mono <<~TEXT.chomp



          ██████
              ██
              ██
        ██████████
      TEXT

      XE = AnsiShadow::Glyph.from_mono <<~TEXT.chomp



         ████████
            ██
            ██
        ██████████
      TEXT

      XYO = AnsiShadow::Glyph.from_mono <<~TEXT.chomp


        ████████
              ██
        ████████
              ██
        ████████
      TEXT

      Dakuten = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
          █
        █  █
         █
      TEXT

      Handakuten = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
        ███
        █ █
        ███
      TEXT

      GA = KA.beside(Dakuten)
      GI = KI.beside(Dakuten)
      GU = KU.beside(Dakuten)
      GE = KE.beside(Dakuten)
      GO = KO.beside(Dakuten)

      ZA = SA.beside(Dakuten)
      JI = SHI.beside(Dakuten)
      ZU = SU.beside(Dakuten)
      ZE = SE.beside(Dakuten)
      ZO = SO.beside(Dakuten)

      DA = TA.beside(Dakuten)
      DI = CHI.beside(Dakuten)
      DU = TSU.beside(Dakuten)
      DE = TE.beside(Dakuten)
      DO = TO.beside(Dakuten)

      BA = HA.beside(Dakuten)
      BI = HI.beside(Dakuten)
      BU = FU.beside(Dakuten)
      BE = HE.beside(Dakuten)
      BO = HO.beside(Dakuten)

      PA = HA.beside(Handakuten)
      PI = HI.beside(Handakuten)
      PU = FU.beside(Handakuten)
      PE = HE.beside(Handakuten)
      PO = HO.beside(Handakuten)

      KANA_MAP = {
        ア: A, イ: I, ウ: U, エ: E, オ: O,
        カ: KA, キ: KI, ク: KU, ケ: KE, コ: KO,
        ガ: GA, ギ: GI, グ: GU, ゲ: GE, ゴ: GO,
        サ: SA, シ: SHI, ス: SU, セ: SE, ソ: SO,
        ザ: ZA, ジ: JI, ズ: ZU, ゼ: ZE, ゾ: ZO,
        タ: TA, チ: CHI, ツ: TSU, テ: TE, ト: TO,
        ダ: DA, ヂ: DI, ヅ: DU, デ: DE, ド: DO,
        ナ: NA, ニ: NI, ヌ: NU, ネ: NE, ノ: NO,
        ハ: HA, ヒ: HI, フ: FU, ヘ: HE, ホ: HO,
        バ: BA, ビ: BI, ブ: BU, ベ: BE, ボ: BO,
        パ: PA, ピ: PI, プ: PU, ペ: PE, ポ: PO,
        マ: MA, ミ: MI, ム: MU, メ: ME, モ: MO,
        ヤ: YA, ユ: YU, ヨ: YO,
        ラ: RA, リ: RI, ル: RU, レ: RE, ロ: RO,
        ワ: WA, ヲ: WO,
        ン: N,
        ー: DASH, ッ: XTSU,
        ャ: XYA, ィ: XI, ュ: XYU, ェ: XE, ョ: XYO
      }.freeze
    end
  end
  # rubocop:enable Metrics/ModuleLength
end
