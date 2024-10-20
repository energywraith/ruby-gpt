require_relative '../lib/ruby_gpt/client'
require_relative '../lib/ruby_gpt/message'

describe RubyGPT::Client do
  let(:client) { RubyGPT::Client.new(ENV.fetch('OPENAI_API_KEY', nil)) }
  let(:messages) { [RubyGPT::Message.new(role: 'user', content: 'Say this is a test!')] }

  it 'cannot be initialized with no api_key' do
    expect { RubyGPT::Client.new }.to raise_error(ArgumentError)
  end

  describe '#completions' do
    it 'returns "This is a test!" for "Say this is a test!" message' do
      completions = client.completions({ messages: messages })
      expect(completions['choices'].first['message'].content).to eql('This is a test!')
    end
    it 'uses model "gpt-4o-mini" passed as an argument' do
      model = 'gpt-4o-mini'
      completions = client.completions({ model: model, messages: messages })
      expect(completions['model']).to include(model)
    end
    it 'throws expection when no messages are provided' do
      expect { client.completions({}) }.to raise_error(ArgumentError)
    end
    it 'throws expection when messages are not instances of RubyGPT:Message' do
      expect do
        client.completions({ messages: { role: 'user', content: 'Say this is a test!' } })
      end.to raise_error(ArgumentError)
    end
  end
end
