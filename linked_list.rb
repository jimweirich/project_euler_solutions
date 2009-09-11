#!/usr/bin/env ruby

def LinkedList(items)
  LinkedList.builder(items) do |b, item|
    b << item
  end
end  

module CovariantEnumerable
  include Enumerable

  def map
    builder do |b, item|
      b << yield(item)
    end
  end
  alias collect map

  def find_all
    builder do |b, item|
      b << item if yield(item)
    end
  end
  alias select find_all

  def reject
    builder do |b, item|
      b << item unless yield(item)
    end
  end

  def grep(re)
    builder do |b, item|
      b << item if re =~ item
    end
  end
end

class LinkedList
  class Builder
    attr_reader :target

    def self.build(collection, &block)
      b = new
      collection.each do |item|
        block.call(b, item)
      end
      b.target
    end

    def initialize
      @target = LinkedList::Empty
      @last = nil
    end
      
    def <<(item)
      if @last
        @last.tail = LinkedList.new(item, LinkedList::Empty)
        @last = @last.tail
      else
        @target = LinkedList.new(item, LinkedList::Empty)
        @last = @target
      end
    end
  end

  class EmptyList
    def size
      0
    end
    def to_a
      []
    end
    def empty?
      true
    end
    def prepend(item)
      LinkedList.new(item, self)
    end
    def join(sep=' ')
      ''
    end
    def to_s
      "()"
    end
  end

  Empty = EmptyList.new

  include CovariantEnumerable

  attr_accessor :head, :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def size
    inject(0) { |r, item| r + 1 }
  end

  def prepend(item)
    LinkedList.new(item, self)
  end
  
  def each
    list = self
    while ! list.empty?
      yield(list.head)
      list = list.tail
    end
  end

  def empty?
    false
  end

  def ==(other)
    list = self
    while ! list.empty? && ! other.empty?
      return true if list.equal?(other)
      return false if list.head != other.head
      list = list.tail
      other = other.tail
    end
    list.equal?(other)
  end

  def join(sep=' ')
    result = ''
    result << head.to_s
    list = tail
    while ! list.empty?
      result << sep if sep
      result << list.head.to_s
      list = list.tail
    end
    to_a.join(sep)
  end

  def to_s
    "(#{join(' ')})"
  end

  def inspect
    to_s
  end

  def builder(&block)
    self.class.builder(self, &block)
  end

  def self.builder(collection, &block)
    Builder.build(collection, &block)
  end

  def self.[](*args)
    LinkedList(args)
  end

end
