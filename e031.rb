#!/usr/bin/env ruby

require 'linked_list'

D = LinkedList[200, 100, 50, 20, 10, 5, 2, 1]

def value(v)
  result = 0
  d = D
  v.each_with_index do |n, i|
    result += n * D.head
    d = d.tail
  end
  result
end
 
def count(total, denominations)
  result = 0
  if ! denominations.empty?
    max_coins = total / denominations.head
    (0..max_coins).each do |ncoins|
      left_over = total - ncoins * denominations.head
      if left_over == 0
        result += 1
      else
        result += count(left_over, denominations.tail)
      end
    end
  end
  result
end

if __FILE__ == $0 then
  p count(200, D)
end
