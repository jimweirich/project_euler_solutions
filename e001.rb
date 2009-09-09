#!/usr/bin/env ruby

p (1...1000).select { |n| (n%3) == 0 || (n%5) == 0 }.inject {|r,n| r+n}
