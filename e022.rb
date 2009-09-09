#!/usr/bin/env ruby

require 'ext/enumerable'

def name_value(name)
  result = 0
  name.each_byte {|b|
    result += b - ?A + 1
  }
  result
end


names = open("names.txt") { |f| f.read }.split(/, */).map { |name| name.gsub(/"/,'') }.sort

result = 0
names.each_with_index { |name, i|
  result += name_value(name) * (i + 1)
}
p result
