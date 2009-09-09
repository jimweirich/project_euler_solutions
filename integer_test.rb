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

  def test_prime_factors
    assert_equal [], 1.prime_factors
    assert_equal [1], 2.prime_factors
    assert_equal [2], 4.prime_factors
    assert_equal [0, 1], 3.prime_factors
    assert_equal [1, 2, 3], (2 * 3**2 * 5**3).prime_factors
  end
end

class FactorialTest < Test::Unit::TestCase

  def test_fact
    assert_equal 1, 1.fact
    assert_equal 2, 2.fact
    assert_equal 6, 3.fact
    assert_equal 120, 5.fact
    assert_equal 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000, 100.fact
  end
end

class EnglishTest < Test::Unit::TestCase
  def test_teens_sizes
    assert_equal "zero".size,       0.english_size
    assert_equal "one".size,        1.english_size
    assert_equal "two".size,        2.english_size
    assert_equal "three".size,      3.english_size
    assert_equal "four".size,       4.english_size
    assert_equal "five".size,       5.english_size
    assert_equal "six".size,        6.english_size
    assert_equal "seven".size,      7.english_size
    assert_equal "eight".size,      8.english_size
    assert_equal "nine".size,       9.english_size
    assert_equal "ten".size,       10.english_size
    assert_equal "eleven".size,    11.english_size
    assert_equal "twelve".size,    12.english_size
    assert_equal "thirteen".size,  13.english_size
    assert_equal "fourteen".size,  14.english_size
    assert_equal "fifteen".size,   15.english_size
    assert_equal "sixteen".size,   16.english_size
    assert_equal "seventeen".size, 17.english_size
    assert_equal "eighteen".size,  18.english_size
    assert_equal "nineteen".size,  19.english_size
  end

  def test_powers_of_10
    assert_equal "twenty".size,  20.english_size
    assert_equal "thirty".size,  30.english_size
    assert_equal "forty".size,  40.english_size
    assert_equal "fifty".size,   50.english_size
    assert_equal "sixty".size,   60.english_size
    assert_equal "seventy".size, 70.english_size
    assert_equal "eighty".size,  80.english_size
    assert_equal "ninety".size,  90.english_size
  end

  def test_under_100
    assert_equal "twentyone".size,  21.english_size
    assert_equal "twentyfive".size, 25.english_size
    assert_equal "sixtyeight".size, 68.english_size
  end

  def test_hundreds
    assert_equal "onehundred".size, 100.english_size
    assert_equal "threehundred".size, 300.english_size
  end

  def test_complex_hundreds
    assert_equal "fivehundredandseventythree".size, 573.english_size
    assert_equal "ninehundredandninetynine".size, 999.english_size
  end

  def test_one_thousand
    assert_equal 11, 1000.english_size
  end

  def test_over_1000
    assert_raise(RuntimeError) do
      1001.english_size
    end
  end

  def test_examples_in_problem_statement
    assert_equal 23, 342.english_size
    assert_equal 20, 115.english_size
  end
end

