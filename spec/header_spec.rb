require 'spec_helper'

describe Cnab150::Header do
  describe '.parse' do
    context 'when is invalid' do
      it do
        expect{ described_class.parse('234567890') }
          .to raise_error(ArgumentError)
              .with_message('Line size is lesser than 150 chars')
      end
    end

    context 'when is valid' do
      subject do
        described_class.parse(line)
      end

      let(:line) do
        "A1AAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBCCCCCCCCCCCCCCCCCCCCCCCEEEEEEEEFFFFFFGGHHHHHHHHHHHHHHHHHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
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
      end
    end
  end
end
