#!/usr/bin/env ruby

require 'primes'

#N = 13195
N = 600851475143

i = N
p = Primes.new
p.next_prime
largest_factor = 1
while i > 1
  if (i % p.current) == 0
    largest_factor = p.current
    i /= largest_factor
  end
  p.next_prime
end

p largest_factor
