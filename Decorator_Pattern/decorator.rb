# Component
class Coffee
  def cost
    2.00
  end

  def description
    "Coffee"
  end
end

# Decorator
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

# Concrete Decorators
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

# Client code
coffee = Coffee.new
puts coffee.description #=> "Coffee"
puts coffee.cost #=> 2.0

coffee_with_milk = Milk.new(coffee)
puts coffee_with_milk.description #=> "Coffee, Milk"
puts coffee_with_milk.cost #=> 2.50

coffee_with_sugar = Sugar.new(coffee)
puts coffee_with_sugar.description #=> "Coffee, Sugar"
puts coffee_with_sugar.cost #=> 2.25

coffee_with_milk_and_sugar = Sugar.new(Milk.new(coffee))
puts coffee_with_milk_and_sugar.description #=> "Coffee, Milk, Sugar"
puts coffee_with_milk_and_sugar.cost #=> 3.00
