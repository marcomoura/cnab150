require 'spec_helper'

describe Cnab150::Layout::G do
  context '.keys' do
    it do
      expect(subject.keys)
        .to match_array [:account,       :agency,          :authentication,
                         :barcode,       :channel,         :credit_date,
                         :filler,        :payment_date,    :payment_type,
                         :registry_code, :registry_number,
                         :service_value, :value]
    end
  end

  context '.layout' do
    it { expect(subject.layout).to eql 'A1A20A8A8A44A12A7A8A4A1A26A5A1' }
  end
end
