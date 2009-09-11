#!/usr/bin/env ruby

require 'ext/enumerable'

def f(n, e)
  sum = 0
  while n > 0
    sum += (n%10) ** e
    n = n / 10
  end
  sum
end


# N = 4
N = 5
LIMIT = (1..10).map { |i| [i, i * (9**N)] }.find { |i, v| i > Math.log10(v) }[1]

sum = 0
(2..LIMIT).each do |n|
 if n == f(n,N)
   sum += n
   end
end
p sum  
