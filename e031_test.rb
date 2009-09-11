require 'test/unit'
require 'e031'

class E031Test < Test::Unit::TestCase
  def test_no_denominations
    assert_equal 0, count(200, LinkedList[])
  end

  def test_single_denomination
    assert_equal 1, count(5, LinkedList[1])
  end

  def test_two_denominations
    assert_equal 2, count(5, LinkedList[5,1])
  end

  def test_three_denominations
    assert_equal 4, count(10, LinkedList[10,5,1])
  end

  def test_big_problem
    assert_equal 4563, count(100, LinkedList[200, 100, 50, 20, 10, 5, 2, 1])
  end
end
