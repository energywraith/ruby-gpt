require_relative 'fetcher'

module RubyGPT
  # The `RubyGPT::Client` class provides a simple interface for interacting
  # with ChatGPT models. This class is initialized with an API key and
  # includes methods to interact with the ChatGPT API.
  class Client
    def initialize(api_key)
      @fetcher = Fetcher.new(api_key)
    end

    def prompt
      @fetcher.get
    end

    # TODO: Make fetcher private, so it can be accessed when user uses GEM
  end
end
