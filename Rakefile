require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'dotenv/tasks'

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*_spec.rb']
  task.fail_on_error = true
end

task test: :dotenv do
  RSpec::Core::RakeTask.new(:test) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end
end

task :run do
  ruby './lib/ruby_gpt.rb'
end

task default: %w[lint test]
