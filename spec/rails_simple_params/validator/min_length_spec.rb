require 'spec_helper'

describe RailsSimpleParams::Validator::MinLength do
  let(:name)    { 'foo' }
  let(:value)   { 'bar' }
  let(:options) { { min_length: min_length } }
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
      let(:min_length) { 3 }

      it_behaves_like 'does not raise error'
    end

    context 'value given is invalid' do
      let(:min_length)    { 44 }
      let(:error_message) { "foo cannot be shorter than #{min_length} characters" }

      it_behaves_like 'raises TooShort'
    end
  end
end
