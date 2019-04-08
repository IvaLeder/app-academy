class Hangman
  attr_reader :guess_word, :remaining_incorrect_guesses, :attempted_chars
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(c)
    @attempted_chars.include?(c)
  end

  def get_matching_indices(c)
    indices = []
    @secret_word.split('').each_with_index { |el, ind| indices.push(ind) if el == c }
    indices
  end

  def fill_indices(c, arr)
    @guess_word.each_with_index { |_el, ind| @guess_word[ind] = c if arr.include?(ind)}
  end

  def try_guess(c)
    if already_attempted?(c)
      puts 'that has already been attempted'
      false
    else
      @attempted_chars.push(c)
      matches = get_matching_indices(c)
      fill_indices(c, matches)
      @remaining_incorrect_guesses -= 1 if matches.empty?
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    choice = gets.chomp
    result = try_guess(choice)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      true
    else
      false
    end
  end
end