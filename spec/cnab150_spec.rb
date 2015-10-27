require 'spec_helper'

describe Cnab150 do
  it 'has a version number' do
    expect(Cnab150::VERSION).not_to be nil
  end

  describe '#parse_registry' do
    subject { described_class.parse_registry(line).to_hash }

    context 'when the registry is a' do
      context 'HEADER' do
        let(:line) do
          'A20000111111111       PREF MUN XXXXXX-XYZ 341BANCO ITAU S.A.     2015101600131203                 F                                                  F'
        end

        context 'should return a hash with' do
          it { is_expected.to include(registry_code: 'A') }
          it { is_expected.to include(registry_type: '2') }
          it { is_expected.to include(agreement: '0000111111111') }
          it { is_expected.to include(organization: 'PREF MUN XXXXXX-XYZ') }
          it { is_expected.to include(bank_code: '341') }
          it { is_expected.to include(bank_name: 'BANCO ITAU S.A.') }
          it { is_expected.to include(file_date: '20151016') }
          it { is_expected.to include(file_number: '001312') }
          it { is_expected.to include(version: '03') }
          it { is_expected.to include(service: '') }
          it { is_expected.to include(filler: 'F                                                  F') }
        end
      end

      describe 'TRAILER' do
        let(:line) do
          'Z00000400000000001533612 Y                                                                                                                           Y'
        end

        context 'should return a hash with' do
          it { is_expected.to include(registry_code: 'Z') }
          it { is_expected.to include(rows: '000004') }
          it { is_expected.to include(total: '00000000001533612') }
          it { is_expected.to include(filler: ' Y                                                                                                                           Y') }
        end
      end
    end

    describe 'DETAIL' do
      let(:line) do
        'G982300210019        20151015201510168166000000005092477201510160000000000000007500000000050900000803120000701594   2                                 '
      end

      context 'should return a hash with' do
        it { is_expected.to include(registry_code: 'G') }
        it { is_expected.to include(account: '982300210019') }
        it { is_expected.to include(payment_date: '20151015') }
        it { is_expected.to include(credit_date: '20151016') }

        it { is_expected.to include(barcode: '81660000000050924772015101600000000000000075') }
        it { is_expected.to include(value: '000000000509') }
        it { is_expected.to include(service_value: '0000080') }
        it { is_expected.to include(registry_number: '31200007') }

        it { is_expected.to include(agency: '0159') }
        it { is_expected.to include(channel: '4') }
        it { is_expected.to include(authentication: '   2') }
        it { is_expected.to include(payment_type: '') }

        it { is_expected.to include(filler: '') }
      end
    end
  end
end
