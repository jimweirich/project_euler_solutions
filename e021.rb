#!/usr/bin/env ruby

require 'ext'

N = 10_000

class Integer
  def amicable?
    b = self.proper_divisors.sum
    b != self && b.proper_divisors.sum == self
  end
end

p (2...N).select { |a| a.amicable? }.sum
