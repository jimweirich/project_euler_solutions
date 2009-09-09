#!/usr/bin/env ruby

require 'ext/integer'

# N = 5
N = 1000

p (1..N).inject(0) { |r, n| r + n.english_size }
