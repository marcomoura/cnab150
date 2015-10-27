require 'spec_helper'

describe Cnab150::Layout::Trailer do
  context '.keys' do
    it do
      expect(subject.keys)
        .to match_array [:filler, :registry_code, :rows, :total]
    end
  end

  context '.layout' do
    it { expect(subject.layout).to eql 'Z1Z6Z17Z126' }
  end
end
