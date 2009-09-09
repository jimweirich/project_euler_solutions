#!/usr/bin/env ruby

require 'ext'

class Integer
  def abundant?
    proper_divisors.sum > self
  end
end

LIMIT = 28123

AB = (1..LIMIT).select { |n| n.abundant? }

SUMS = []

AB.each do |i|
  AB.each do |j|
    s = i + j
    break if s > LIMIT
    SUMS[s] = true
  end
end

sum = 0
SUMS.each_with_index do |flag, i|
  sum += i unless flag
end
p sum
