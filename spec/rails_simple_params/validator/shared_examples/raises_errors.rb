RSpec.shared_examples 'raises EmptyParameter' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::EmptyParameter, error_message)
  end
end

RSpec.shared_examples 'raises InvalidFormat' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::InvalidFormat, error_message)
  end
end

RSpec.shared_examples 'raises InvalidIdentity' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::InvalidIdentity, error_message)
  end
end

RSpec.shared_examples 'raises InvalidOption' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::InvalidOption, error_message)
  end
end

RSpec.shared_examples 'raises InvalidParameter' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::InvalidParameter, error_message)
  end
end

RSpec.shared_examples 'raises MissingParameter' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::MissingParameter, error_message)
  end
end

RSpec.shared_examples 'raises OutOfRange' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::OutOfRange, error_message)
  end
end

RSpec.shared_examples 'raises TooLarge' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::TooLarge, error_message)
  end
end

RSpec.shared_examples 'raises TooLong' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::TooLong, error_message)
  end
end

RSpec.shared_examples 'raises TooShort' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::TooShort, error_message)
  end
end

RSpec.shared_examples 'raises TooSmall' do
  it 'raises error with message' do
    expect { subject.validate! }.to raise_error(RailsSimpleParams::TooSmall, error_message)
  end
end
