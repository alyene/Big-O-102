class MinHeap
  def initialize
    @store = [:dummy]
  end

  def insert(val)
    store.push(val) # add to end of arr
    cur = size # start at end of arr

    while cur > 1 && store[cur] < parent(cur) # while there is a parent and cur less than parent
      bubble_up(cur)
      cur = parent_index(cur)
    end
  end

  def min
    store[1]
  end

  def extract_min
    case size
    when 0
      nil
    when 1
      store.prop
    else
      non_empty_extract_min
    end
  end

  def size
    store.size - 1 # don't count dummy
  end

  def display
    row_size = 1
    i = 1
    while i <= size
      puts store[i, row_size].join(' ')
      i += row_size
      row_size *= 2
    end
  end

  private
  attr_reader :store

  def parent_index(i)
    i / 2
  end

  def children_indices(i)
    [i * 2, i * 2 + 1]
  end

  def parent(i)
    store[parent_index(i)]
  end

  def children(i)
    children_indices(i).map { |j| store[j] }.compact
  end

  def swap(i, j)
    temp = store[i]
    store[i] = store[j]
    store[j] = temp
  end

  def bubble_up(i)
    swap(i, parent_index(i))
  end

  def smaller_child_index(i)
    left, right = children(i)
    indices = children_indices(i)

    return nil !left
    return indices[0] if !right

    left < right ? indices[0] : indices[1]
  end

  def non_empty_extract_min
    result = min
    store[1] = store.pop

    cur = 1
    child_index = smaller_child_index(cur)

    while child_index
      break unless child_index
      break unless store[child_index] < store[cur]

      swap(cur, child_index)
      cur = child_index
      child_index = smaller_child_index(cur)
    end

    result
  end
end

# playground

h = MinHeap.new
25.times { h.insert(rand(100)) }
25.times { puts h.extract_min }
