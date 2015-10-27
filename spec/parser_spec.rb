require 'spec_helper'

describe Cnab150::Parser do
  describe '.build' do
    subject { described_class.build(line, layout) }

    let(:layout) { 'A75A75' }

    context 'when is invalid' do
      let(:line) { '234567890' }

      it do
        expect { subject }
          .to raise_error(ArgumentError)
          .with_message('Line size is lesser than 150 chars')
      end
    end

    context 'when is valid' do
      let(:line) { ['A' * 75, 'B' * 75].join }

      it do
        expect(subject.to_a).to match_array ['A' * 75, 'B' * 75]
      end
    end
  end
end
