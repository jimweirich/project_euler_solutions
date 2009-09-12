#!/usr/bin/env ruby

require 'mathn'

def variants(n,d)
  n1, n2 = n.div(10), n%10
  d1, d2 = d.div(10), d%10
  result = []
  if d1 != 0
    result << n1/d1 if n2 == d2
    result << n2/d1 if n1 == d2
  end
  if d2 != 0
    result << n1/d2 if n2 == d1
    result << n2/d2 if n1 == d1
  end
  result
end

answer = 1
(10..99).each do |n|
  (n+1..99).each do |d|
    next if d%10 == 0 && n%10 == 0
    vars = variants(n,d)
    if vars.any? { |v| v == n/d }
      answer = answer * n/d
      puts "DBG: [n,d]=#{[n,d].inspect}"
    end
  end
end

p answer.denominator
