#!/usr/bin/env ruby

# NOTE: This is really slow.

n = 1
while ! (2..20).all? { |d| n%d == 0 }
  n += 1
end
p n
