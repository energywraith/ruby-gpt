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

    def completions(body)
      raise ArgumentError, "The 'messages' key is required in the body" unless body.key?(:messages)

      unless body[:messages].all? { |message| message.is_a?(RubyGPT::Message) }
        raise ArgumentError, 'All messages must be instances of RubyGPT::Message'
      end

      body[:messages] = body[:messages].map(&:to_h)

      # Use DEFAULT_MODEL if no model is specified in the body
      body[:model] ||= DEFAULT_MODEL

      @fetcher.post(OPEN_AI_COMPLETIONS_URL, @headers.get, body)
    end
  end
end
