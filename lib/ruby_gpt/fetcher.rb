require 'http'
require_relative 'headers'

module RubyGPT
  # Fetcher is a private class responsible for handling the actual
  # data retrieval process from the API.
  class Fetcher
    def post(endpoint, headers, body)
      response = make_post_request(endpoint, headers, body)
      parse_response(response)
    end

    private

    def make_post_request(endpoint, headers, body)
      HTTP.headers(headers).post(endpoint, json: body)
    end

    def parse_response(response)
      JSON.parse(response.body)
    end
  end

  private_constant :Fetcher
end
