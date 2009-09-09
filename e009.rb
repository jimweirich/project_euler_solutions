#!/usr/bin/env ruby

(1..332).each do |a|
  ((a+1) .. (1000 - a - 2)).each do |b|
    c = 1000 - a - b
    if a**2 + b**2 == c**2
      p a*b*c
      exit
    end
  end
end
    
