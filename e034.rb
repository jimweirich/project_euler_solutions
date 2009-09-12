#!/usr/bin/env ruby

require 'ext/integer/fact'
require 'ext/enumerable'

FACTS = (0..9).map { |i| i.fact }

def explode(n)
  result = []
  while n > 0
    result << n%10
    n = n / 10
  end
  result
end

N = 50000
# N = 2540160

p (3..N).select { |n|  n == explode(n).map { |i| FACTS[i] }.sum }.sum
