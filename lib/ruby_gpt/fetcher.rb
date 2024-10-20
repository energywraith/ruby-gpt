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
      parsed_body = JSON.parse(response.body)

      if response.code.to_i >= 400 || parsed_body['error']
        error_message = parsed_body['error'] ? parsed_body['error']['message'] : "HTTP Error: #{response.code}"
        raise StandardError, error_message
      end

      parse_choices(parsed_body)
    end

    # Convert messages from the response into RubyGPT::Message instances
    def parse_choices(body_json)
      return body_json unless body_json.dig('choices', 0, 'message')

      body_json['choices'].map! do |choice|
        message = choice['message']
        choice['message'] = RubyGPT::Message.new(role: message['role'], content: message['content'])
        choice
      end

      body_json
    end
  end

  private_constant :Fetcher
end
