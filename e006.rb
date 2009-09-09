#!/usr/bin/env ruby

require 'ext/enumerable'

N = 100

p( ((1..N).map { |i| i*i }.sum - (1..N).sum**2).abs )
