require 'spec_helper'

describe Cnab150::Registry do
  describe '.to_hash' do
    subject { described_class.build(line).to_hash }

    context 'when the registry is a' do
      context 'HEADER' do
        let(:line) do
          "A20000111111111       PREF MUN XXXXXX-XYZ 341BANCO ITAU S.A.     2015101600131203                 F                                                  F"
        end

        context 'should return a hash with' do
          it { is_expected.to include(registry_code: "A") }
          it { is_expected.to include(registry_type: "2") }
          it { is_expected.to include(agreement: "0000111111111") }
          it { is_expected.to include(organization: "PREF MUN XXXXXX-XYZ") }
          it { is_expected.to include(bank_code: "341") }
          it { is_expected.to include(bank_name: "BANCO ITAU S.A.") }
          it { is_expected.to include(file_date: "20151016") }
          it { is_expected.to include(file_number: "001312") }
          it { is_expected.to include(version: "03") }
          it { is_expected.to include(service: "") }
          it { is_expected.to include(filler: "F                                                  F") }
        end
      end

      describe 'TRAILER' do
        let(:line) do
          "Z00000400000000001533612 Y                                                                                                                           Y"
        end

        context 'should return a hash with' do
          it { is_expected.to include(registry_code: "Z") }
          it { is_expected.to include(rows: "000004") }
          it { is_expected.to include(total: "00000000001533612") }
          it { is_expected.to include(filler: ' Y                                                                                                                           Y') }
        end
      end
    end
  end
end
