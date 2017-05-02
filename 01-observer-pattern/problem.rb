=begin
	The three players in the system are the weather station (the physical device that acquires the actual 
	weather data), the WeatherData object (that tracks the data coming from the Weather Station and updates 
	the displays), and the display that shows users the current weather conditions.
=end

class WeatherData # Subject
	attr_writer :temp, :humidity, :pressure

	def initialize(overrides = {})
		@current_conditions_display = overrides.fetch(:current_conditions_display) do
			CurrentConditionsDisplay.new
		end
		@statistics_display = overrides.fetch(:statistics_display) do
			StatisticsDisplay.new
		end
		@forecast_display = overrides.fetch(:forecast_display) do
			ForecastDisplay.new
		end	
	end

	def get_temperature
		60
	end

	def get_humidity
		20
	end

	def get_pressure
		30
	end

	def measurements_changed
		temp = get_temperature
		humidity = get_humidity
		pressure = get_pressure

		@current_conditions_display.update(temp, humidity, pressure)
		@statistics_display.update(temp, humidity, pressure)
		@forecast_display.update(temp, humidity, pressure)
	end
end

class CurrentConditionsDisplay # Observer
	def update(temp, humidity, pressure)
		puts 'updated current conditions'
	end
end

class StatisticsDisplay # Observer
	def update(temp, humidity, pressure)
		puts 'updated statistics'
	end
end

class ForecastDisplay # Observer
	def update(temp, humidity, pressure)
		puts 'updated forecast'
	end
end

weather = WeatherData.new
weather.measurements_changed

=begin
	Problems:

	By coding to concrete implementations we have no way to add or remove other display elements without 
	making changes to the program
=end