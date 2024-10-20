require_relative '../lib/ruby_gpt/client'

describe RubyGPT::Client do
  describe '#prompt' do
    it 'returns TBD for prompt method' do
      client = RubyGPT::Client.new(ENV.fetch('OPENAI_API_KEY', nil))
      expect(client.prompt).to eql('This is a test!')
    end
  end
end
