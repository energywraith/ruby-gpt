module RubyGPT
  # The `RubyGPT::Client` class provides a simple interface for interacting
  # with ChatGPT models. This class is initialized with an API key and
  # includes methods to interact with the ChatGPT API.
  class Client
    @api_key = nil

    def initialize(api_key)
      @api_key = api_key
      puts 'I have been initialised'
    end

    def prompt
      'TBD'
    end
  end
end
