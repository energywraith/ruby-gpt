require_relative '../lib/ruby_gpt'

describe RubyGPT do
  let(:api_key) { ENV.fetch('OPENAI_API_KEY', nil) }

  it 'has a version number' do
    expect(RubyGPT::VERSION).not_to be nil
  end

  it 'can initialize a client' do
    client = RubyGPT::Client.new(api_key: api_key)
    expect(client).to be_an_instance_of(RubyGPT::Client)
  end

  it 'can not initialize internal classes' do
    expect { RubyGPT::Headers.new(api_key) }.to raise_error(NameError)
    expect { RubyGPT::Fetcher.new }.to raise_error(NameError)
  end
end
