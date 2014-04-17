require 'rubygems'
require 'pry-debugger'
module ArrayUtil

  # # # # # # #
  # Iterative #
  # # # # # # #
  def self.bsearch(array, element)
    # If the array is empty return a result
    # Otherwise call your helper _bsearch method
    start_index = 0
    end_index = array.length-1
    if array == []
      return false
    end
    ArrayUtil._bsearch(array, element, start_index, end_index)
  end

  def self._bsearch(array, element, start_index, end_index)
    # If the start and end indeces are the same, search
    # that element and return

    if array[start_index] == array[end_index] && array[end_index] == element
      return true
    elsif array[start_index] == array[end_index]
      return false
    end

    # Otherwise, find the midpoint
    midpoint = start_index + (end_index - start_index) / 2

    # If the element is greater than the one at midpoint, call
    #   _bsearch on the right half of the remaining array
    # Otherwise, call _bsearch on left half of the remaining array
    if array[midpoint] == element
      return true
    elsif array[midpoint] < element
      end_index = midpoint
      return _bsearch(array, element, start_index, end_index)
    elsif array[midpoint] > element
      start_index = midpoint + 1
      return _bsearch(array, element, start_index, end_index)
    end
  end

  # # # # # # #
  # Recursive #
  # # # # # # #
  def self.bsearch(array, element)
    return false if array == []
    _bsearch(array, element, 0, array.size-1)
  end

  def self._bsearch(array, element, start_index, end_index)
    return array[start_index] == element if start_index == end_index

    midpoint = start_index + (end_index - start_index) / 2
    
    if element > array[midpoint]
      _bsearch(array, element, midpoint+1, end_index)
    else
      _bsearch(array, element, start_index, midpoint)
    end
  end
end

