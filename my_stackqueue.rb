require_relative 'my_stack'
require "byebug"


class MinMaxStackQueue

  def initialize
    @store_in = MyStack.new
    @store_out = MyStack.new
  end

  def enqueue(el)
    @store_in.push(el)
  end

  def dequeue
    #debugger
    if @store_out.empty?
      until @store_in.empty?
        @store_out.push(@store_in.pop)
      end
    end

    @store_out.pop
  end

  def size
    @store_in.size + @store_out.size
  end

  def empty?
    @store_in.empty?
  end

  def max
    #debugger
    if @store_in.empty?
      p @store_out.max
    elsif @store_out.empty?
      p @store_in.max
    else
      p [@store_in.max, @store_out.max].max
    end
  end

  def min
    if @store_in.empty?
      p @store_out.min
    elsif @store_out.empty?
      p @store_in.min
    else
      p [@store_in.min, @store_out.min].min
    end
  end

end
