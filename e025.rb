#!/usr/bin/env ruby

# N = 3
N = 1000

def digits(n)
  n.to_s.size
end

def fib(n)
  a, b = 1, 1
  n.times do 
    yield(a)
    a, b = b, a+b
  end
end

i = 0
fib(10000) do |n|
  i += 1
  if digits(n) == N
    puts i
    exit
  end
end
