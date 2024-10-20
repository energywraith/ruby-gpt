# Ruby-GPT-Client

RubyGPT Client is a Ruby gem that provides an interface for interacting with the OpenAI GPT models. This gem simplifies the process of sending messages and receiving completions from the ChatGPT API.

## Technology

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.6.0 |

## Features

- Create message objects with predefined roles.
- Send message arrays to the ChatGPT API for processing.
- Handle model and temperature configurations.
- Easy integration with your Ruby applications.

## Installation

To install the gem, add this line to your application's Gemfile:

```ruby
gem 'ruby-gpt-client'
```

Or install it yourself as:

```bash
gem install ruby-gpt-client
```

## Sending Completions

To send a completion request, you can use the completions method:

```ruby
client = RubyGPT::Client.new(api_key: 'YOUR_API_KEY')

messages = [
  RubyGPT::Message.new(role: 'user', content: 'Hello, how are you?'),
  RubyGPT::Message.new(role: 'assistant', content: 'I am fine, thank you!')
]

response = client.completions(messages: messages, temperature: 0.5, model: 'gpt-4o-mini')

puts response
```

## Default Parameters

The completions method allows you to set default values for the model and temperature parameters. You can omit these parameters, and the defaults will be used:

```ruby
response = client.completions(messages: messages)
```

## Development

To contribute to this project, clone the repository and install the dependencies:

```bash
git clone https://github.com/energywraith/ruby_gpt.git
cd ruby_gpt
bundle install
```

Run tests using:

```bash
rake
```

## Contributing

- Fork the project
- Create your feature branch (git checkout -b feature/my-feature)
- Commit your changes (git commit -m 'Add some feature')
- Push to the branch (git push origin feature/my-feature)
- Create a new Pull Request

## Acknowledgements

- OpenAI for the API and models.