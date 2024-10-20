require_relative '../lib/ruby_gpt/message'

describe RubyGPT::Message do
  let(:message) { RubyGPT::Message.new(role: 'user', content: 'Say this is a test!') }

  it 'can be initialized' do
    expect(message).to be_an_instance_of(RubyGPT::Message)
  end

  it 'role, message can be accessed' do
    expect(message.role).to eql('user')
    expect(message.content).to eql('Say this is a test!')
  end

  it 'throws for invalid parameters' do
    expect { RubyGPT::Message.new(role: 'UNKNOWN', content: 'Content') }.to raise_error(ArgumentError)
    expect { RubyGPT::Message.new(role: 'user', content: nil) }.to raise_error(ArgumentError)
  end
end
