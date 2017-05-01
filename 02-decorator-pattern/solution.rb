class Beverage # Abstract Component
	attr_accessor :description, :cost, :size

	def initialize()
		@description = 'Unknown Beverage'
		@cost = cost()
		@size = 'small'
	end
end

class Espresso < Beverage # Component
	def initialize()
		@description = 'Espresso'
		@cost = 1.99
	end
end

class HouseBlend < Beverage # Component
	def initialize()
		@description = 'House Blend'
		@cost = 0.89
	end
end

class DarkRoast < Beverage # Component
	def initialize()
		@description = 'Dark Roast'
		@cost = 1.15
	end
end

class CondimentDecorator < Beverage # Decorator
 # ???
end

class Mocha < CondimentDecorator # Decorator
	def initialize(bevarage)
		@bevarage = bevarage
		@description = @bevarage.description + ', Mocha'
		@cost = @bevarage.cost + 0.20
	end
end

class Soy < CondimentDecorator # Decorator
	def initialize(bevarage)
		@bevarage = bevarage
		@description = @bevarage.description + ', Soy'
		@cost = @bevarage.cost + 0.15
	end
end

class Whip < CondimentDecorator # Decorator
	def initialize(bevarage)
		@bevarage = bevarage
		@description = @bevarage.description + ', Whip'
		@cost = @bevarage.cost + 0.10
	end
end

espresso = Espresso.new
puts "#{espresso.description} $#{espresso.cost}"

dark_roast = DarkRoast.new
dark_roast = Mocha.new(dark_roast)
dark_roast = Mocha.new(dark_roast)
puts "#{dark_roast.description} $#{dark_roast.cost}"

house_blend = HouseBlend.new
house_blend = Soy.new(house_blend)
house_blend = Whip.new(house_blend)
puts "#{house_blend.description} $#{house_blend.cost}"

