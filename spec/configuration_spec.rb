require 'spec_helper'

module Cnab150
  describe Configuration do
    subject { Configuration.new }
    describe '#layout_file_path' do
      context 'default value' do
        let(:default) { 'cnab150/lib/../config/layout.yml' }
        it { expect(subject.layout_file_path).to end_with(default) }
      end

      context 'override the default layout file path' do
        let(:file_path) { 'fake.yml' }
        before { subject.layout_file_path = file_path }
        it { expect(subject.layout_file_path).to eql(file_path) }
      end
    end

    describe '#configure' do
      let(:file_path) { 'fake.yml' }
      before do
        Cnab150.configure do |config|
          config.layout_file_path = file_path
        end
      end

      it { expect(Cnab150.config.layout_file_path).to eq file_path }
    end
  end
end
