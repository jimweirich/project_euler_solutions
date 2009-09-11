#!/usr/bin/env ruby

require 'primes'

P = Primes.new(100000)

N = 999
# N = 42

def count_primes(a,b)
  n = 0
  loop do
    x = n*n + a*n + b
    break unless P.prime?(x)
    n += 1
  end
  n
end

max_a, max_b = 0,0
max_primes = 0
(-N..N).each do |b|
  (-N..N).each do |a|
    nprimes = count_primes(a,b)
    if nprimes > max_primes
      max_a, max_b = a, b
      max_primes = nprimes
    end
  end
end

p max_a * max_b
