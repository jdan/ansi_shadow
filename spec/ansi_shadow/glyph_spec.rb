# frozen_string_literal: true

RSpec.describe AnsiShadow::Glyph do
  it "recalls characters" do
    glyph = described_class.from_mono <<~TEXT
       x
        x
      xxx
    TEXT

    expect(glyph.to_s).to eq <<~TEXT.chomp
       █
        █
      ███
    TEXT
  end

  it "can stack glyphs" do
    glider = described_class.from_mono <<~TEXT
       x
        x
      xxx
    TEXT

    top_right_box = described_class.new(
      [
        " **".chars,
        " **".chars
      ]
    )

    expect(glider.atop(top_right_box).to_s).to eq <<~TEXT.chomp
       █*
       *█
      ███
    TEXT
  end

  it "can generate shadows for glyphs" do
    letter_a = described_class.from_mono <<~TEXT.chomp
       █████
      ██   ██
      ███████
      ██   ██
      ██   ██
    TEXT

    expect(letter_a.shadow.to_s).to eq <<~TEXT.chomp
       █████╗
      ██╔══██╗
      ███████║
      ██╔══██║
      ██║  ██║
      ╚═╝  ╚═╝
    TEXT
  end

  it "can fetch a row for a given glyph" do
    letter_a = described_class.from_mono <<~TEXT.chomp
       █████
      ██   ██
      ███████
      ██   ██
      ██   ██
    TEXT

    expect(letter_a.row(0)).to eq(" █████ ")
  end

  it "can place gylphs beside each other" do
    trunc_letter_a = described_class.from_mono <<~TEXT.chomp
       █████
      ██   ██
      ███████
      ██   ██
    TEXT
    letter_b = described_class.from_mono <<~TEXT.chomp
      ██████
      ██   ██
      ██████
      ██   ██
      ██████
    TEXT

    expect(trunc_letter_a.beside(letter_b).to_s).to eq <<~TEXT.chomp
       █████  ██████
      ██   ██ ██   ██
      ███████ ██████
      ██   ██ ██   ██
              ██████
    TEXT
  end

  it "can configure the spacing between characters beside each other" do
    trunc_letter_a = described_class.from_mono <<~TEXT.chomp
       █████
      ██   ██
      ███████
      ██   ██
    TEXT

    letter_b = described_class.from_mono <<~TEXT.chomp
      ██████
      ██   ██
      ██████
      ██   ██
      ██████
    TEXT

    expect(trunc_letter_a.beside(letter_b, spacing: 3).to_s).to eq <<~TEXT.chomp
       █████    ██████
      ██   ██   ██   ██
      ███████   ██████
      ██   ██   ██   ██
                ██████
    TEXT
  end

  it "can add shadows to characters placed next to each other" do
    letter_a = described_class.from_mono <<~TEXT.chomp
       █████
      ██   ██
      ███████
      ██   ██
      ██   ██
    TEXT

    letter_b = described_class.from_mono <<~TEXT.chomp
      ██████
      ██   ██
      ██████
      ██   ██
      ██████
    TEXT

    expect(letter_a.beside(letter_b, spacing: 3).shadow.to_s).to eq <<~TEXT.chomp
       █████╗   ██████╗
      ██╔══██╗  ██╔══██╗
      ███████║  ██████╔╝
      ██╔══██║  ██╔══██╗
      ██║  ██║  ██████╔╝
      ╚═╝  ╚═╝  ╚═════╝
    TEXT
  end
end
