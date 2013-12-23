require_relative '../lib/grid'

describe Grid do
  describe '#words' do
    subject { grid.words.sort }

    let(:grid) { Grid.new cells }

    context '0x0' do
      let(:cells) { [] }

      it { expect(subject).to be_empty }
    end

    context '1x1' do
      let(:cells) { [%w[a]] }

      it { expect(subject).to eq ['a'] }
    end

    context '2x2' do
      let(:cells) {
        [
          %w[a b],
          %w[c d]
        ]
      }

      it {
        expect(subject).to eq %w[
          a b c d ab ac ad ba bc bd ca cb cd da db dc abc abd acb acd adb adc
          bac bad bca bcd bda bdc cab cad cba cbd cda cdb dab dac dba dbc dca
          dcb abcd abdc acbd acdb adbc adcb bacd badc bcad bcda bdac bdca cabd
          cadb cbad cbda cdab cdba dabc dacb dbac dbca dcab dcba
        ].sort
      }
    end

    context '3x3' do
      let(:cells) {
        [
          %w[a b c],
          %w[d e f],
          %w[g h i],
        ]
      }

      let(:words) {
        path = File.expand_path('../3x3.txt', __FILE__)
        File.readlines(path).map(&:strip).sort
      }

      it { expect(subject).to eq words }
    end
  end
end
