#!/usr/bin/env ruby

require 'ext/integer'

N = 500
# N = 5

n = 1
tn = 1
while tn.divisor_count <= N
  n += 1
  tn += n
end
p tn
