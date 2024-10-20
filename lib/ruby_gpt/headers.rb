module RubyGPT
  # Headers is a private class responsible for generating HTTP request
  # headers required for API requests.
  class Headers
    def initialize(api_key)
      @headers = {
        'Authorization' => "Bearer #{api_key}",
        'Content-Type' => 'application/json'
      }
    end

    def get
      @headers
    end
  end

  private_constant :Headers
end
