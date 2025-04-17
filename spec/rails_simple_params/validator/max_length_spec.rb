require 'spec_helper'

describe RailsSimpleParams::Validator::MaxLength do
  let(:name)    { 'foo' }
  let(:value)   { 'bar' }
  let(:options) { { max_length: max_length } }
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
      let(:max_length) { 3 }

      it_behaves_like 'does not raise error'
    end

    context 'value given is invalid' do
      let(:max_length)    { 2 }
      let(:error_message) { "foo cannot be longer than #{max_length} characters" }

      it_behaves_like 'raises TooLong'
    end
  end
end
