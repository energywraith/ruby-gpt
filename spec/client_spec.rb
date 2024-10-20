require_relative '../lib/ruby_gpt/client'

describe RubyGPT::Client do
  describe '#completions' do
    it 'returns TBD for prompt method' do
      client = RubyGPT::Client.new(ENV.fetch('OPENAI_API_KEY', nil))
      completions = client.completions
      expect(completions['choices'][0]['message']['content']).to eql('This is a test!')
    end
  end
end
