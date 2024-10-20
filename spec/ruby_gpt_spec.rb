require_relative '../lib/ruby_gpt'

describe RubyGPT do
  it 'has a version number' do
    expect(RubyGPT::VERSION).not_to be nil
  end

  it 'can initialize a client' do
    client = RubyGPT::Client.new(ENV.fetch('OPENAI_API_KEY', nil))
    expect(client).to be_an_instance_of(RubyGPT::Client)
  end

  it 'can not initialize internal classes' do
    expect { RubyGPT::Headers.new(ENV.fetch('OPENAI_API_KEY', nil)) }.to raise_error(NameError)
    expect { RubyGPT::Fetcher.new(ENV.fetch('OPENAI_API_KEY', nil)) }.to raise_error(NameError)
  end
end
