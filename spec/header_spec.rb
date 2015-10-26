require 'spec_helper'

describe Cnab150::Header do
  subject { described_class.new(line).to_hash }
  describe '.to_hash' do
    let(:line) do
      "A1AAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBCCCCCCCCCCCCCCCCCCCCCCCEEEEEEEEFFFFFFGGHHHHHHHHHHHHHHHHHIJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJL"
    end

    context 'should return a hash' do
      it { is_expected.to include(registry_code: "A") }
      it { is_expected.to include(registry_type: "1") }
      it { is_expected.to include(agreement: "AAAAAAAAAAAAAAAAAAAA") }
      it { is_expected.to include(organization: "BBBBBBBBBBBBBBBBBBBB") }
      it { is_expected.to include(bank_name: "CCCCCCCCCCCCCCCCCCCC") }
      it { is_expected.to include(file_date: "EEEEEEEE") }
      it { is_expected.to include(file_number: "FFFFFF") }
      it { is_expected.to include(version: "GG") }
      it { is_expected.to include(service: "HHHHHHHHHHHHHHHHH") }
      it { is_expected.to include(filler: "IJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJL") }
    end
  end
end
