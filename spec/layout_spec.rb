require 'spec_helper'

describe Cnab150::Layout do
  describe '#build' do
    context 'when the layout does not exists' do
      it do
        expect { described_class.build('Y') }.to raise_error Cnab150::Errors::LayoutNotImplementedError
      end
    end
  end
end

