#!/usr/bin/env ruby

require 'primes'

#N = 6
N = 10001

p Primes.new(200_000)[N-1]
