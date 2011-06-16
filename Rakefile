require 'rubygems' if RUBY_VERSION < '1.9'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'bundler/gem_tasks'

begin
  require 'rake/rdoctask'
rescue
  require 'rdoc/task'
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/test')

Rake::RDocTask.new do |rdoc|
  files =['README', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README" # page to start on
  rdoc.title = "serradura-string_utility_belt Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end
