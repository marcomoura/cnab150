require 'spec_helper'

describe Cnab150::Trailer do
  subject { described_class.new(line).to_hash }
  describe '.to_hash' do
    let(:line) do
      "Z11111100000000000000000ABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBC"
    end

    context 'should return a hash' do
      it { is_expected.to include(registry_code: "Z") }
      it { is_expected.to include(rows: "111111") }
      it { is_expected.to include(total: "00000000000000000") }
      it { is_expected.to include(filler: "ABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBC") }
    end
  end
end

