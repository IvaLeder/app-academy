class Dog
  def initialize(name, breed, age, bark, favorites)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorites
  end

  def name
   @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def bark
    @age > 3 ? @bark.upcase : @bark.downcase
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(food)
    @favorite_foods.map(&:downcase).include?(food.downcase)
  end
end
