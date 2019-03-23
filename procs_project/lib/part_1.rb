def my_map(arr, &block)
  new_arr = []
  index = 0
  while index < arr.length
    new_arr.push(block.call(arr[index]))
    index += 1
  end
  new_arr
end

def my_select(arr, &block)
  new_arr = []
  index = 0
  while index < arr.length
    if block.call(arr[index]) == true
      new_arr.push(arr[index])
    end
    index += 1
  end
  new_arr
end

def my_count(arr, &block)
  new_arr = []
  index = 0
  while index < arr.length
    if block.call(arr[index]) == true
      new_arr.push(arr[index])
    end
    index += 1
  end
  new_arr.length
end

def my_any?(arr, &block)
  index = 0
  while index < arr.length
    return true if block.call(arr[index]) == true
    index += 1
  end
  false
end

def my_all?(arr, &block)
  index = 0
  while index < arr.length
    return false if block.call(arr[index]) == false
    index += 1
  end
  true
end

def my_none?(arr, &block)
  index = 0
  while index < arr.length
    return false if block.call(arr[index]) == true
    index += 1
  end
  true
end