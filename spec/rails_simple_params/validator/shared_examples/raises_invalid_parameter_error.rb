RSpec.shared_examples 'raises InvalidParameterError' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::InvalidParameterError, error_message)
  end
end
