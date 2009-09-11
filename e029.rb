#!/usr/bin/env ruby

# N = 5
N = 100

numbers = []
(2..N).each do |a|
  (2..N).each do |b|
    numbers << a**b
  end
end

p numbers.uniq.size
