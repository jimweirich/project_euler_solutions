#!/usr/bin/env ruby

class Integer
  def palindrome?
    to_s.split(//).reverse.join == to_s
  end
end

answer = 0
(100..999).each do |i|
  (i..999).each do |j|
    n = i*j
    answer = n if n > answer && n.palindrome?
  end
end
p answer
