require 'spec_helper'

describe Cnab150::Layout::Header do
  context '.keys' do
    it do
      expect(subject.keys)
        .to match_array [:registry_code , :registry_type ,
                         :agreement     , :organization  ,
                         :bank_code     , :bank_name     ,
                         :file_date     , :file_number   ,
                         :version       , :service       ,
                         :filler]
    end
  end

  context '.layout' do
    it { expect(subject.layout).to eql 'A1A1A20A20A3A20A8A6A2A17A52' }
  end
end
