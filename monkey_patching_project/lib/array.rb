# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

    self.max - self.min
  end

  def average
    return nil if self.length == 0

    self.sum.to_f / self.length
  end

  def median
    return nil if self.length == 0

    sorted = self.sort { |a, b| a - b }
    middle = self.length / 2
    if self.length.even?
      (sorted[middle] + sorted[middle - 1]) / 2.0
    else
      sorted[middle]
    end
  end

  def counts
    self.inject({}) do | acc, el |
      if acc.has_key?(el)
        acc[el] += 1
      else
        acc[el] = 1
      end
      acc
    end
  end

  def my_count(val)
    self.inject(0) do |acc, ele|
      if ele == val
        acc += 1
      end
      acc
    end
  end

  def my_index(val)
    index = nil
    self.each_with_index do |el, ind|
      if el == val
        return ind
      end
    end
    index
  end

  def my_uniq
    arr = []
    hash = self.counts
    hash.each_pair { |k, _v| arr.push(k)}
    arr
  end

  def my_transpose
    transposed_arr = []
    index = 0
    while index < self[0].length {
      new_arr = []
      self.each { |el| new_arr << el[index] }
      index += 1
      transposed_arr << new_arr
    }
    end
    transposed_arr
  end
end
