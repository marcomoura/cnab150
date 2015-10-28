require 'spec_helper'

describe Cnab150::Layout::Z do
  context '.keys' do
    it do
      expect(subject.keys)
        .to match_array [:filler, :registry_code, :rows, :total]
    end
  end

  context '.layout' do
    it { expect(subject.layout).to eql 'A1A6A17A126' }
  end
end
