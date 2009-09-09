#!/usr/bin/env ruby

class Integer
  def even?
    self%2 == 0
  end
end

N = 4_000_000

def fib
  a = 1
  b = 2
  while a <= N
    yield(a)
    a, b = b, a+b
  end
end
  
sum = 0
fib { |n| sum += n if n.even? }
puts sum
