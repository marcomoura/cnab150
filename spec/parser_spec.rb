require 'spec_helper'

describe Cnab150::Parser do
  describe '.to_a' do
    subject { described_class.to_a(line, layout) }

    let(:layout) { 'A75A75' }

    context 'when is invalid' do
      let(:line) { '234567890' }

      it do
        expect{ subject }
          .to raise_error(ArgumentError)
          .with_message('Line size is lesser than 150 chars')
      end
    end

    context 'when is valid' do
      let(:line) do
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
      end

      it do
        is_expected
          .to eql %w{AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                     BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB}
      end
    end
  end
end
