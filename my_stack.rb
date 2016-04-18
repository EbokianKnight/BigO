require "byebug"

class MyStack
  attr_reader

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def push(el)

    if @max.empty? || @max.last < el
      @max << el
    else
      @max << @max.last
    end

    if @min.empty? || @min.last > el
      @min << el
    else
      @min << @min.last
    end

    @store.push(el)
  end


  def pop
    @max.pop
    @min.pop
    @store.pop
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def max
    raise "The stack is empty" if empty?
    @max.last
  end

  def min
    raise "The stack is empty" if empty?
    @min.last
  end

end
