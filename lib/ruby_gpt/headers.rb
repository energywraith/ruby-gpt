module RubyGPT
  # Headers is a private class responsible for generating HTTP request
  # headers required for API requests.
  class Headers
    def initialize(api_key)
      @api_key = api_key
    end

    def build
      {
        'Authorization' => "Bearer #{@api_key}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
