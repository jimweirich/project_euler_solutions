#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'

task :default => [:test, :check]

task :check do
  sh "./check.rb"
end

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['*_test.rb']
end
