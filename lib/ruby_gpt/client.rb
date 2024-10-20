require_relative 'fetcher'

module RubyGPT
  # The `RubyGPT::Client` class provides a simple interface for interacting
  # with ChatGPT models. This class is initialized with an API key and
  # includes methods to interact with the ChatGPT API.
  class Client
    OPEN_AI_COMPLETIONS_URL = 'https://api.openai.com/v1/chat/completions'.freeze
    DEFAULT_MODEL = 'gpt-3.5-turbo'.freeze

    def initialize(api_key)
      @headers = Headers.new(api_key)
      @fetcher = Fetcher.new
    end

    def completions(body = { model: DEFAULT_MODEL, messages: [{ role: 'user', content: 'Say this is a test!' }] })
      @fetcher.post(OPEN_AI_COMPLETIONS_URL, @headers.get, body)
    end
  end
end
