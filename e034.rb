#!/usr/bin/env ruby

require 'ext/integer/fact'
require 'ext/integer/digits'
require 'ext/enumerable'

FACTS = (0..9).map { |i| i.fact }

N = 50000
# N = 2540160

p (3..N).select { |n| n == n.digits.map { |i| FACTS[i] }.sum }.sum
