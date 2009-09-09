#!/usr/bin/env ruby

require 'ext/enumerable'
require 'ext/integer'

p 100.fact.to_s.split(//).map { |n| n.to_i }.sum
