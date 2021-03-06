require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'
require 'pry'

class PotluckTest < Minitest::Test

  def test_it_exists
    potluck = Potluck.new(@date)

    assert_instance_of Potluck, potluck
  end

  def test_the_date
    potluck = Potluck.new("7-13-18")

    assert_equal "7-13-18", potluck.date
  end

  def test_dishes_array
    potluck = Potluck.new("7-13-18")

    assert_equal ([]), potluck.dishes
  end

  def test_add_dish
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad",:appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    assert_equal couscous_salad, potluck.add_dish(couscous_salad)
    assert_equal cocktail_meatballs, potluck.add_dish(cocktail_meatballs)
  end

  def test_add_dish_to_dishes
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad",:appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    assert_equal ([couscous_salad, cocktail_meatballs]), potluck.dishes
    assert_equal 2, potluck.dishes.length
  end

  def test_get_all_from_category
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    assert_equal couscous_salad, potluck.get_all_from_category(:appetizer).first
  end




end
