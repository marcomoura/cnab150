require 'spec_helper'

describe Cnab150::Registry do
  describe '.to_hash' do
    subject { described_class.new('', registry, parse) }
    before { subject.to_hash }
    let(:registry) { spy }
    let(:parse) { spy }

    it { expect(registry).to have_received(:layout) }
    it { expect(parse).to have_received(:build) }
  end
end
