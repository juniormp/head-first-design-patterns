class Pizza
	attr_accessor :type
	
	def prepare
		puts 'Preparing ' + @type + ' pizza'
	end

	def bake
		puts 'Baking ' + @type + ' pizza'
	end

	def cut
		puts 'Cutting ' + @type + ' pizza'
	end

	def box
		puts 'boxing ' + @type + ' pizza'
	end
end

class CheesePizza < Pizza
	def initialize
		@type = 'cheese'
	end
end

class HamPizza < Pizza
	def initialize
		@type = 'ham'
	end
end

class GreekPizza < Pizza
	def initialize
		@type = 'greek'
	end
end

class PizzaFactory

	def initialize(overrides = {})
		@pizza = overrides.fetch(:pizza) do
			Pizza.new
		end
	end

	def createPizza(type)
		if (type == 'cheese')
			pizza = CheesePizza.new
		elsif (type == 'ham')
			pizza = HamPizza.new
		elsif (type == 'greek')
			pizza = GreekPizza.new
		end
	end
end

class PizzaStore
	def initialize(overrides = {})
		@factory = overrides.fetch(:factory) do
			PizzaFactory.new
		end
	end

	def order_pizza(type)
		pizza = @factory.createPizza(type)

		pizza.prepare
		pizza.bake
		pizza.cut
		pizza.box
	end
end

store = PizzaStore.new
store.order_pizza('ham')

