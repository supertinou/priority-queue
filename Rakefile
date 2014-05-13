require "bundler/gem_tasks"
require 'rake/testtask'

task default: %w[test]

task :setup do
  ruby "setup.rb"
end

Rake::TestTask.new do |t|
  t.libs << ["test", "ext"]
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end
