class BTree

  include Enumerable

  def insert(val)
    if root
      rec_insert(val, root)
    else
      self.root = Node.new(val)
    end

    self
  end

  def each(&blk)
    rec_each(root, &blk) if root
    self
  end

  def inspect
    "#<BTree #{to_a}>"
  end

  def contains?(val)
    rec_contains?(val, root)
  end

  def display
    root && rec_display(root, 0)
  end

  private

  attr_accessor :root

  def rec_display(node, indent)
    return '' unless node
    str = "\n#{'  ' * indent}#{node.val}"
    str += rec_display(node.left, indent + 1)
    str += rec_display(node.right, indent + 1)
    str
  end

  def rec_each(node, &blk)
    node.left && rec_each(node.left, &blk)
    blk.call(node.val)
    node.right && rec_each(node.right, &blk)
  end

  def rec_insert(val, node)
    if val < node.val
      node.left ? rec_insert(val, node.left) : node.left = Node.new(val)
    else
      node.right ? rec_insert(val, node.right) : node.right = Node.new(val)
    end
  end

  def rec_contains?(val, node)
    if val < node.val
      node.left ? rec_contains?(val, node.left) : false
    elsif val > node.val
      node.right ? rec_contains?(val, node.right) : false
    else
      true
    end
  end
end


class BTree
  class Node
    attr_accessor :val, :left, :right
    def initialize(val)
      @val = val
    end
  end
end

b = BTree.new
b.insert 0
b.insert -4
b.insert 4
b.insert -5
b.insert 5
b.insert -3
b.insert 3
b.insert 6
b.insert -6
b.insert 2
b.insert -2
puts b.display
