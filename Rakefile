require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |config|
  config.libs << 'lib'
  config.test_files = Dir['test/*_test.rb']
end
