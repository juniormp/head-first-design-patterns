=begin
	Starbuzz Coffe grown so quickly, they’re scrambling to update their ordering systems to match their
	beverage offerings.

	In addition to your coffee, you can also ask for several condiments like steamed milk, soy, and mocha 
	(otherwise known as chocolate), and have it all topped off with whipped milk. Starbuzz charges a bit 
	for each of these, so they really need to get them built into their order system.
=end

class Beverage
	attr_accessor :description

	def initialize(description)
		@description = description
	end

	def cost
		return 10
	end
end

class HouseBlend < Beverage
	def cost
		return super + 10
	end
end

class DarkRoast < Beverage
	def cost
		return super + 30
	end
end

class Decaf < Beverage
	def cost
		return super + 13
	end
end

class Espresso < Beverage
	def cost
		return super + 5
	end
end

# class explosion -> more variarity of combinations make it impossible for the future maintenance

class HouseBlendWithMilk < Beverage
	def cost
		return super + 22
	end
end

class DecafWithCaramelAndMocha < Beverage
	def cost
		return super + 20
	end
end

class DarkRoastWithWhipandSoy < Beverage
	def cost
		return super + 10
	end
end

h = HouseBlend.new('HouseBlend')
p h.description
p h.cost

=begin
	Has created a maintenance nightmare for themselves. What happens when the price of milk goes up? 
	What do they do when they add a new caramel topping?
	Thinking beyond the maintenance problem, which of the design principles that we’ve covered so far 
	are they violating? R: Program to an interface, not an implementation and Favor composition over inheritance.
=end