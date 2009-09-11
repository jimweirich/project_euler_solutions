require 'test/unit'
require 'linked_list'

class LinkListTest < Test::Unit::TestCase
  def test_empty_list
    list = LinkedList::Empty
    assert_equal 0, list.size
    assert_equal [], list.to_a
    assert list.empty?
  end

  def test_add_an_item_to_a_list
    list = LinkedList::Empty.prepend(1)
    assert_equal 1, list.head
    assert_equal 1, list.size
    assert_equal [1], list.to_a
    assert_equal LinkedList::Empty, list.tail
  end

  def test_add_two_items_to_a_list
    list = LinkedList[2, 1]
    assert_equal 2, list.head
    assert_equal 2, list.size
    assert_equal [2,1], list.to_a
    assert_equal LinkedList([1]), list.tail
  end

  def test_equal
    assert_equal LinkedList[], LinkedList[]
    assert_equal LinkedList[1], LinkedList[1]
    assert_equal LinkedList[1,2], LinkedList[1,2]
  end

  def test_not_equal
    assert_not_equal LinkedList[], LinkedList[1]
    assert_not_equal LinkedList[1], LinkedList[]
    assert_not_equal LinkedList[1], LinkedList[2]
  end

  def test_can_convert_array_to_list
    assert_equal LinkedList::Empty, LinkedList[]
    assert_equal [1], LinkedList::Empty.prepend(1).to_a
    assert_equal [2,1], LinkedList::Empty.prepend(1).prepend(2).to_a
  end

  def test_can_use_convience_method
    assert_equal [1,2,3], LinkedList([1,2,3]).to_a
  end

  def test_can_convert_to_string
    assert_equal "()", LinkedList[].to_s
    assert_equal "(1)", LinkedList[1].to_s
    assert_equal "(1 2)", LinkedList[1, 2].to_s
  end

  def test_can_inspect_a_string
    assert_equal "()", LinkedList[].inspect
    assert_equal "(1)", LinkedList[1].inspect
    assert_equal "(1 2)", LinkedList[1, 2].inspect
  end

  def test_can_join
    assert_equal "", LinkedList[].join
    assert_equal '1', LinkedList[1].join
    assert_equal '1 2', LinkedList[1, 2].join

    assert_equal '1:2', LinkedList[1,2].join(':')
  end

  def test_covariant_return_types
    expected = LinkedList[2]

    assert_equal expected, LinkedList[1].map { |i| i + 1}
    assert_equal expected, LinkedList[1].collect { |i| i + 1}

    assert_equal expected, LinkedList[1,2,3].select { |i| i%2 == 0 }
    assert_equal expected, LinkedList[1,2,3].find_all { |i| i%2 == 0 }

    assert_equal expected, LinkedList[1,2,3].reject { |i| i%2 != 0 }

    assert_equal LinkedList['2'], LinkedList['1','2','3'].grep(/^2/) { |x| x.to_i }
  end
end
