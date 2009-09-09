#!/usr/bin/env ruby

require 'test/unit'
require 'primes'

class PrimesTest < Test::Unit::TestCase
  def test_first_prime_is_two
    p = Primes.new
    p.next_prime
    assert_equal 2, p.current
  end

  def test_next_prime_is_three
    p = Primes.new
    p.next_prime
    p.next_prime
    assert_equal 3, p.current
  end

  def test_next_prime_is_five
    p = Primes.new
    p.next_prime
    p.next_prime
    p.next_prime
    assert_equal 5, p.current
  end

  def test_prime_list
    p = Primes.new
    assert_equal [2,3,5,7,11,13], p.primes(6)
  end

  def test_prime_while
    p = Primes.new
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19], p.while { |p| p < 20 }
  end

end
