require 'rake'
require 'rake/testtask'
require_relative 'merchants_guide.rb'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run the main application'
task :run do
  MerchantsGuide.new.start
end

task :default  => [:test]
