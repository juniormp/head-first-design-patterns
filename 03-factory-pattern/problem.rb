=begin
	PizzaStore - You’d add some code that determines the appropriate type of pizza and then goes about making the pizza.
	You realize that all of your competitors have added a couple of trendy pizzas to their menus: the Clam Pizza and 
	the Veggie Pizza. Obviously you need to keep up with the competition, so you’ll add these items to your menu. 
	And you haven’t been selling many Greek Pizzas lately, so you decide to take that off the menu.
=end

class CheesePizza
	attr_accessor :type

	def initialize
		@type = 'cheese'
	end
end

class HamPizza
	attr_accessor :type

	def initialize
		@type = 'ham'
	end
end

class GreekPizza
	attr_accessor :type

	def initialize
		@type = 'greek'
	end
end

class PizzaStore
	attr_accessor :pizza

	def order_pizza(type)
		if (type == 'cheese')
			pizza = CheesePizza.new
		elsif (type == 'ham')
			pizza = HamPizza.new
		elsif (type == 'greek')
			pizza = GreekPizza.new
		end

		prepare(pizza)
		bake(pizza)
		cut(pizza)
		box(pizza)
	end

	def prepare(pizza)
		puts 'Preparing ' + pizza.type + ' pizza'
	end

	def bake(pizza)
		puts 'Baking ' + pizza.type + ' pizza'
	end

	def cut(pizza)
		puts 'Cutting ' + pizza.type + ' pizza'
	end

	def box(pizza)
		puts 'boxing ' + pizza.type + ' pizza'
	end
end

store = PizzaStore.new
store.order_pizza('ham')


# Clearly, dealing with which concrete class is instantiated is really messing up our orderPizza() method and preventing it from being closed for modification.