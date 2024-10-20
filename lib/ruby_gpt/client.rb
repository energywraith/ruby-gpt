require_relative 'fetcher'

module RubyGPT
  # The `RubyGPT::Client` class provides a simple interface for interacting
  # with ChatGPT models. This class is initialized with an API key and
  # includes methods to interact with the ChatGPT API.
  class Client
    OPEN_AI_COMPLETIONS_URL = 'https://api.openai.com/v1/chat/completions'.freeze
    DEFAULT_MODEL = 'gpt-3.5-turbo'.freeze
    DEFAULT_TEMPERATURE = 0.7

    def initialize(api_key:)
      raise ArgumentError, "The 'api_key' argument is required" unless api_key

      @headers = Headers.new(api_key: api_key)
      @fetcher = Fetcher.new
    end

    def completions(messages:, model: DEFAULT_MODEL, temperature: DEFAULT_TEMPERATURE)
      validate_messages(messages)

      body = {
        messages: messages.map(&:to_h),
        model: model,
        temperature: temperature
      }

      @fetcher.post(OPEN_AI_COMPLETIONS_URL, @headers.get, body)
    end

    private

    def validate_messages(messages)
      if messages.nil? || messages.empty?
        raise ArgumentError,
              "The 'messages' parameter is required"
      end

      return if messages.all? { |message| message.is_a?(RubyGPT::Message) }

      raise ArgumentError, 'All messages must be instances of RubyGPT::Message'
    end
  end
end
