def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject{ |dog| dog["age"] < 3}
end

def count_positive_subarrays(arr)
  arr.count{ |el| el.sum > 0 }
end

def aba_translate(s)
  vowels = 'aeiou'
  array = s.split('').map do |c|
    vowels.include?(c) ? "#{c}b#{c}" : "#{c}"
  end
  array.join('')
end

def aba_array(arr)
  arr.map{ |el| aba_translate(el) }
end

p aba_array(["cat", "dog", "butterfly"])