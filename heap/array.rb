require_relative 'min_heap'

class Array
  def heap_sort
    heap = MinHeap.new
    each { |e| heap.insert(e) }
    map { heap.extract_min }
  end
end

## playground
a = [5,7,2,4,1,0,8,9,3,6]
a.heap_sort
