require 'spec_helper'

describe RailsSimpleParams::Validator::Is do
  let(:name)    { 'foo' }
  let(:options) { { is: '50' } }
  let(:type)    { String }
  let(:parameter) do
    RailsSimpleParams::Parameter.new(
      name: name,
      value: value,
      options: options,
      type: type
    )
  end

  subject { described_class.new(parameter) }

  describe '#validate!' do
    context 'value given is valid' do
      let(:value) { '50' }

      it_behaves_like 'does not raise error'
    end

    context 'value given is invalid' do
      let(:value)         { '51' }
      let(:error_message) { 'foo must be 50' }

      it_behaves_like 'raises InvalidIdentity'
    end
  end
end
