require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Iva') }
  subject(:suffle) { Dessert.new('suffle', 22, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(suffle.type).to eq('suffle')
    end
    it "sets a quantity" do
      expect(suffle.quantity).to eq(22)
    end
    it "starts ingredients as an empty array" do
      expect(suffle.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('suffle', 'some', 'Iva').to raise_error(ArgumentError) }
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      suffle.add_ingredient('cocoa')
      expect(suffle.ingredients).to include('cocoa')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      shuffled_ingredients = suffle.ingredients.shuffle
      expect(suffle.ingredients).not_to be(shuffled_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      suffle.eat(1)
      expect(suffle.quantity).to eq(21)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { suffle.eat(23).to raise_error("not enough left!") }
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Iva the Great Baker")
      expect(suffle.serve).to eq("Chef Iva the Great Baker has made 22 suffles!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:make_more).with(suffle)
      chef.make_more(suffle)
    end
  end
end
