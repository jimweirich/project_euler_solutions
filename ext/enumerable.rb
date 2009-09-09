#!/usr/bin/env ruby

module Enumerable
  def sum
    inject(0) { |r, i| r + i }
  end
  def product
    inject(1) { |r, i| r * i }
  end
end
