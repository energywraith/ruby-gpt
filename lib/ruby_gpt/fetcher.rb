require_relative 'headers'

module RubyGPT
  # Fetcher is a private class responsible for handling the actual
  # data retrieval process from the API.
  class Fetcher
    def initialize(api_key)
      @headers = Headers.new(api_key).get
    end

    def get
      'This is a test!'
    end

    # Define methods for fetching data here
  end

  private_constant :Fetcher
end
