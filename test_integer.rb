#!/usr/bin/env ruby

require 'test/unit'
require 'ext/integer'

class DivisorTest < Test::Unit::TestCase
  def test_divisors
    assert_equal [1], 1.divisors
    assert_equal [1,2], 2.divisors    
    assert_equal [1,3], 3.divisors    
    assert_equal [1,2,4], 4.divisors    
    assert_equal [1,2,4,7,14,28], 28.divisors
    assert_equal [1,2,3,4,6,9,12,18,36], 36.divisors
  end

  def test_divisor_count
    assert_equal 1.divisors.size,  1.divisor_count
    assert_equal 2.divisors.size,  2.divisor_count
    assert_equal 3.divisors.size,  3.divisor_count
    assert_equal 4.divisors.size,  4.divisor_count
    assert_equal 28.divisors.size, 28.divisor_count
    assert_equal 36.divisors.size, 36.divisor_count
  end

  def test_fact
    assert_equal 1, 1.fact
    assert_equal 2, 2.fact
    assert_equal 6, 3.fact
    assert_equal 120, 5.fact
    assert_equal 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000, 100.fact
  end
end
