class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.has_key?(el.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise 'Invalid pegs'
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    Code.new(Array.new(length) { |_el| POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(s)
    Code.new(s.split(''))
  end

  def [](ind)
    @pegs[ind]
  end

  def length
    @pegs.size
  end

  def num_exact_matches(guess)
    count = 0
    self.pegs.each_with_index do |_el, i|
      if self.pegs[i] == guess.pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess_copy = guess.pegs.slice(0 .. -1)
    self.pegs.each_with_index do |el, ind|
      if guess_copy.include?(el)
        count += 1
        found_index = guess_copy.index(el)
        guess_copy.delete_at(found_index)
      end
    end
    count - num_exact_matches(guess)
  end

  def ==(other_code)
    return false if self.length != other_code.length
    self.pegs.each_with_index do |_el, i|
       return false unless self.pegs[i] == other_code.pegs[i]
    end
    true
  end
end

puts Code.from_string('RGGB').num_near_matches(Code.from_string('RGBG'))