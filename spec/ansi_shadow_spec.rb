# frozen_string_literal: true

RSpec.describe AnsiShadow::Glyph do
  it "recalls characters" do
    glyph = AnsiShadow::Glyph.new <<~TEXT
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
end
