def reverser(str, &bl)
  bl.call(str.reverse)
end

def word_changer(str, &bl)
  str.split(' ').map { |el| bl.call(el)}.join(' ')
end

def greater_proc_value(n, pr1, pr2)
  [pr1.call(n), pr2.call(n)].max
end

def and_selector(arr, pr1, pr2)
  arr.select{ |el| pr1.call(el) && pr2.call(el) }
end

def alternating_mapper(arr, pr1, pr2)
  arr.each_with_index.map do |el, i|
    i.even? ? pr1.call(el) : pr2.call(el)
  end
end
