
class MyStack

  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
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

end
