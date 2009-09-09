#!/usr/bin/env ruby

p (2**1000).to_s.split(//).map { |n| n.to_i }.inject { |r, i| r+i }
