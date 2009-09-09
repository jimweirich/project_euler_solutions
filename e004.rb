#!/usr/bin/env ruby

class Integer
  def palindrome?
    to_s.split(//).reverse.join == to_s
  end
end

p (100..999).map { |i| (i..999).map { |j| i*j } }.flatten.select { |n| n.palindrome? }.max
