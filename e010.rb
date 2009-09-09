#!/usr/bin/env ruby

require 'primes'

# N = 10
N = 2_000_000

p = Primes.new(N + 100)
sum = 0
while p.next_prime < N
  sum += p.current
end
p sum
