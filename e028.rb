#!/usr/bin/env ruby

# N = 5
N = 1001

def ur(i)
  (2 * i + 1) ** 2
end

def lr(i)
  (2*i - 1)**2 + 2 * i
end

def ll(i)
  (2*i)**2 + 1
end

def ul(i)
  (2*i)**2 + (2*i + 1)
end

limit = (N-1) / 2
sum = 1
(1..limit).each do |i|
  sum += ur(i) + lr(i) + ll(i) + ul(i)
end
p sum
