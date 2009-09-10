#!/usr/bin/env ruby

require 'ext'

N = 1_000_000
# N = 10
A = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def how_many(n, k)
  result = 1
  while n > result * k
    result += 1
  end
  result - 1
end

pool = A
result = []
n = N
f = 9
while n > 0 && ! pool.empty?
  fact = f.fact
  i = how_many(n, fact)
  result << pool[i]
  pre = pool[0,i]
  post = pool[i+1, 1000]
  pool = pre + post
  n -= i * fact
  f -= 1
end
puts result.map { |i| i.to_s }.join
