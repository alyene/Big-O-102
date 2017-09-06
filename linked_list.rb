class LinkedList
  include Enumerable

  def initialize
    @head = nil
  end

  def push(val)
    cur = head
    if cur
      tail.next = Node.new(val)
    else
      self.head = Node.new(val)
    end

    self
  end

  def pop
    if empty?
      nil
    elsif count == 1
      remove_head
    else
      long_list_pop
    end
  end

  def shift
    empty? ? nil : remove_head
  end

  def unshift(val)
    new_head = Node.new(val)
    new_head.next = head
    self.head = new_head

    self
  end

  def each
    cur = head
    while cur
      yield(cur.val)
      cur = cur.next
    end
  end

  def display
    to_a.join(' ~> ')
  end

  def inspect
    "#<LinkedList #{to_a}>"
  end

  def empty?
    count == 0
  end

  def first
    head&.val
  end

  def last
    tail&.val
  end

  def get(index)
    count = 0
    cur = head

    while cur
      return cur.val if count == index
      cur = cur.next
      count += 1
    end

    nil

  end

  private

  attr_accessor :head

  def remove_head
    val = head.val
    self.head = head.next
    val
  end

  def tail
    cur = head
    while cur && cur.next
      cur = cur.next
    end

    cur
  end

  def long_list_pop
    prev = head
    cur = prev.next
    while cur && cur.next
      prev = cur
      cur = cur.next
    end
    last = cur.val
    prev.next = nil
    last
  end

end

class LinkedList
  class Node
    attr_accessor :val, :next
    def initialize(val)
      @val = val
    end
  end
end

l = LinkedList.new
l.push 1
l.push 2
l.push 3
