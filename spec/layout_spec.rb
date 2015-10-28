require 'spec_helper'

describe Cnab150::Layout do
  describe '#build' do
    context 'when the layout exists' do
      it { expect( described_class.build('A') ).to be_a_kind_of Cnab150::Layout::A }
      it { expect( described_class.build('G') ).to be_a_kind_of Cnab150::Layout::G }
      it { expect( described_class.build('Z') ).to be_a_kind_of Cnab150::Layout::Z }
    end

    context 'when the layout does not exists' do
      it do
        expect { described_class.build('Y') }.to raise_error Cnab150::Errors::LayoutNotImplementedError
      end
    end
  end
end

