class Coffee
  def cost
    2.00
  end

  def description
    "Coffee"
  end
end

class CoffeeDecorator < Coffee
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost
  end

  def description
    @coffee.description
  end
end

class Milk < CoffeeDecorator
  def cost
    @coffee.cost + 0.50
  end

  def description
    @coffee.description + ", Milk"
  end
end

class Sugar < CoffeeDecorator
  def cost
    @coffee.cost + 0.25
  end

  def description
    @coffee.description + ", Sugar"
  end
end

coffee = Coffee.new
puts coffee.description
puts coffee.cost

coffee_with_milk = Milk.new(coffee)
puts coffee_with_milk.description
puts coffee_with_milk.cost

coffee_with_sugar = Sugar.new(coffee)
puts coffee_with_sugar.description
puts coffee_with_sugar.cost

coffee_with_milk_and_sugar = Sugar.new(Milk.new(coffee))
puts coffee_with_milk_and_sugar.description
puts coffee_with_milk_and_sugar.cost
