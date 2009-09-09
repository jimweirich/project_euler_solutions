#!/usr/bin/env ruby

if ARGV.empty?
  puts "ruby run.rb NNN"
else
  prog = "%03d" % ARGV.first.to_i
  start = Time.now
  actual = `ruby e#{prog}.rb`.to_i
  delta = Time.now - start
  puts "#{actual}  (#{delta} seconds)"
end
