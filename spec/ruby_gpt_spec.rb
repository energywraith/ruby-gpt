require_relative '../lib/ruby_gpt'

describe RubyGPT::Client do
  describe '#prompt' do
    it 'returns TBD for prompt method' do
      client = RubyGPT::Client.new('API_KEY')
      expect(client.prompt).to eql('TBD')
    end
  end
end
