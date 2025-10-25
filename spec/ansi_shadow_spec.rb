# frozen_string_literal: true

RSpec.describe AnsiShadow::Glyph do
  it "recalls characters" do
    glyph = AnsiShadow::Glyph.from_mono <<~TEXT
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
    glider = AnsiShadow::Glyph.from_mono <<~TEXT
       x
        x
      xxx
    TEXT

    top_right_box = AnsiShadow::Glyph.new(
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
    letter_a = AnsiShadow::Glyph.from_mono <<~TEXT.chomp
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
end
