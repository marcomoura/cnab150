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
          'A20000111111111       PREF MUN XXXXXX-XYZ 341BANCO ITAU S.A.     ' \
          '2015101600131203                 F                               ' \
          '                   F'
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
          it do
            is_expected
              .to include(filler:
                      'F                                                  F')
          end
        end
      end

      describe 'TRAILER' do
        let(:line) do
          'Z00000400000000001533612 Y                                       ' \
          '                                                                 ' \
          '                   Y'
        end

        context 'should return a hash with' do
          let(:filter) do
            ' Y                                                             ' \
            '                                                              Y'
          end

          it { is_expected.to include(registry_code: 'Z') }
          it { is_expected.to include(rows: '000004') }
          it { is_expected.to include(total: '00000000001533612') }
          it do
            is_expected
              .to include(filler: filter)
          end
        end
      end
    end

    describe 'DETAIL' do
      let(:line) do
        'G982300210019        2015101520151016816600000000509247720151016000' \
        '0000000000007500000000050900000803120000701594   2                 ' \
        '                '
      end
      let(:barcode) do
        '81660000000050924772015101600000000000000075'
      end

      context 'should return a hash with' do
        it { is_expected.to include(registry_code: 'G') }
        it { is_expected.to include(account: '982300210019') }
        it { is_expected.to include(payment_date: '20151015') }
        it { is_expected.to include(credit_date: '20151016') }

        it { is_expected.to include(barcode: barcode) }
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

  context '#parse_registries' do
    subject { described_class.parse_registries(lines) }

    let(:lines) do
      [
        'A20000111111111       PREF MUN XXXXXX-XYZ 341BANCO ITAU S.A.     20' \
        '15101600131203                                                     ' \
        '                ',
        'G982300210019        2015101520151016816600000000509247720151016000' \
        '0000000000007500000000050900000803120000701594   2                 ' \
        '                ',
        'G982300210019        2015101520151016816900000002301247720151031020' \
        '1200230228200100000000230100000803120001183477   2                 ' \
        '                ',
        'Z00000400000000001533612                                           ' \
        '                                                                   ' \
        '                '
      ]
    end

    it { expect(subject.size).to eql 4 }

    context '#select' do
      subject { described_class.select(:g, lines) }

      it do
        expect(subject.first.barcode)
          .to be_eql('81660000000050924772015101600000000000000075')
      end

      it do
        expect(subject.last.barcode)
          .to be_eql('81690000000230124772015103102012002302282001')
      end
    end
  end

  context 'getters' do
    let(:registries) do
      [
        double(registry_code: 'A'), double(registry_code: 'G', row: 1),
        double(registry_code: 'G', row: 2), double(registry_code: 'Z')
      ]
    end

    context '#header' do
      subject { described_class.header(registries) }

      it { expect(subject.registry_code).to be_eql('A') }
    end

    context '#details' do
      subject { described_class.details(registries) }

      it 'return details registries' do
        is_expected
          .to satisfy { |d| d.all? { |r| r.registry_code.eql?('G') } }
      end
    end

    context '#trailer' do
      subject { described_class.trailer(registries) }

      it { expect(subject.registry_code).to be_eql('Z') }
    end
  end
end
