require 'rubygems'
require 'bundler/gem_tasks'

['lib', 'test'].each do |folder_name| 
  path = File.join(File.dirname(__FILE__), folder_name)
  $LOAD_PATH.unshift(path)
end

desc 'Running all the tests'
namespace :test do
  task :all do
    require 'test'
  end
end
