class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap # every node is smaller than or equal to it's children

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def remove()
    return nil if @store.empty?
    # swap the root node and last leaf
    swap(0, @store.length - 1)
    # delete the last leaf
    result = @store.pop
    # start heap_down with the new root
    heap_down(0) unless @store.empty?
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.size == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(n)
  def heap_up(index)
    # base case: if we hit root
    return if index == 0
    # compare new node with it's parent
    # if they are out of order swap and heap-up using the parent's index number
    parent = (index - 1) / 2
    if @store[index].key < @store[parent].key # if current < parent, swap
      swap(index, parent)
      # recursion base case: if we hit root or if parent value < current node value
      heap_up(parent)
    end
    
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than it's parent node.
  def heap_down(index)
    # base case: until current doesn't have children || max child < array[current]
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    max_child = @store.size
    return if index == (max_child)
    if @store[left_child] && @store[right_child] # if both children
      min_child = [@store[left_child].key, @store[right_child].key].min
      if min_child == @store[left_child].key # if left to right order, swap left and heap down left
        swap(left_child, index)
        heap_down(left_child)
      else
        swap(right_child, index)
        heap_down(right_child)
      end
    elsif @store[left_child] # there must be a left child
      if @store[left_child].key < @store[index].key
        swap(left_child, index)
        heap_down(left_child)
      else
        swap(right_child, index)
        heap_down(right_child)
      end
    end
    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end