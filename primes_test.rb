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

  def test_prime_index
    p = Primes.new
    assert_equal 2, p[0]
    assert_equal 3, p[1]
    assert_equal 31, p[10]
  end

  def test_at_sieve_limit
    p = Primes.new(10)
    assert_equal 7, p[3]
  end

  def test_beyond_sieve_limit
    p = Primes.new(10)
    assert_raise(RuntimeError) do
      p[4]      
    end
  end

  def test_prime?
    p = Primes.new(12)
    assert ! p.prime?(-1)

    assert p.prime?(2)
    assert p.prime?(3)
    assert p.prime?(5)

    assert ! p.prime?(4)
    assert ! p.prime?(6)
    assert ! p.prime?(9)
  end
end
