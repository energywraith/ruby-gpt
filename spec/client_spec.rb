require_relative '../lib/ruby_gpt/client'
require_relative '../lib/ruby_gpt/message'

describe RubyGPT::Client do
  describe '#completions' do
    it 'returns TBD for prompt method' do
      client = RubyGPT::Client.new(ENV.fetch('OPENAI_API_KEY', nil))
      messages = [RubyGPT::Message.new(role: 'user', content: 'Say this is a test!')]
      completions = client.completions({ messages: messages })
      expect(completions['choices'].first['message'].content).to eql('This is a test!')
    end
  end
end
