#!/usr/bin/env ruby

require 'primes'

NORMAL = Primes.new.while { |p| p < 20 }

# Convert a number to a list of prime factor exponents.
def prime_vector(n)
  NORMAL.map { |p|
    c = 0
    while (n % p) == 0
      c += 1
      n = n / p
    end
    c
  }
end

def max_vector(a,b)
  (0...a.size).map { |i| [a[i], b[i]].max }
end

def prime_vector_to_i(vec)
  (0...vec.size).inject(1) { |r, i| r * NORMAL[i]**vec[i] }
end

v = [0] * NORMAL.size
(2..20).each do |i| v = max_vector(v, prime_vector(i)) end
p prime_vector_to_i(v)

