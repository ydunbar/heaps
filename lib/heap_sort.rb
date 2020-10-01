

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  if list.size < 2
    return list
  end
  heap = MinHeap.new
  list.each do |element|
    heap.add(element)
  end
  result = []
  list.size.times do
    result << heap.remove
  end
  return result
end

# Since you do n additions and adding 1 item to a heap is O(log n), filling up the heap is O(n log n).
# Then removing all n item is O(n log n) because removing one item from a heap is O(log n).
# So the total Time Complexity is O(n log n + n log n) = O(n log n)

# you can do HeapSort with O(1) space complexity (using the original array for the heap).