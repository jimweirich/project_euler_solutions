#!/usr/bin/env ruby

N = 1000
# N = 30

def repeat_length(d)
  seen = []
  n = 1
  while n > 0
    i = seen.index(n)
    return seen.size - i if i
    seen << n
    n = (n*10) % d
  end
  0
end

if __FILE__ == $0 then
  
  answer = 0
  longest = 0
  (1...N).each do |i|
    rep = repeat_length(i)
    if rep > longest
      longest = rep
      answer = i
    end
  end
  p answer
  
end
