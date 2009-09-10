#!/usr/bin/env ruby

require 'ext/integer/fact'

N = 1_000_000
# N = 10

pool = (0..9).to_a
result = []
remaining = N - 1
f = pool.size - 1
while ! pool.empty?
  fact = f.fact
  i = remaining / fact
  remaining %= fact
  result << pool[i]
  pool.delete_at(i)
  f -= 1
end
puts result.map { |i| i.to_s }.join
