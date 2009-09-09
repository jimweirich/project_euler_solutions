#!/usr/bin/env ruby

require 'ext/enumerable'

def fact(n)
  (2..n).inject(1) { |r, i| r*i }
end

p fact(100).to_s.split(//).map { |n| n.to_i }.sum
