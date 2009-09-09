#!/usr/bin/env ruby

require 'date'

d = Date.parse("Jan 1, 1901") + 5
end_date = Date.parse("Dec 31, 2000")
count = 0
while d <= end_date
  count += 1 if d.day == 1
  d += 7
end
p count
