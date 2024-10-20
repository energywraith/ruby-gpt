Gem::Specification.new do |s|
  s.name = 'ruby-gpt-client'
  s.version = '0.1.0'
  s.required_ruby_version = '>= 2.6.0'
  s.summary = 'Ruby GPT Client - ChatGPT client written in Ruby'
  s.description = 'ChatGPT client written in Ruby.'
  s.authors = ['energywraith']
  s.email = 'energywraith@gmail.com'
  s.homepage = 'https://github.com/energywraith/ruby-gpt'
  s.files = ['lib/ruby_gpt.rb', 'lib/ruby_gpt/client.rb', 'lib/ruby_gpt/fetcher.rb', 'lib/ruby_gpt/headers.rb',
             'lib/ruby_gpt/message.rb']
  s.metadata['rubygems_mfa_required'] = 'true'
end
