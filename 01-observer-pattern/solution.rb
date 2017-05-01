module Subject
	def initialize(overrides = {})
		@observers = overrides.fetch(:observers) do
			Array.new
		end
	end

	def register_observer(observer)
		@observers.push(observer)
	end

	def remove_observer(observer)
		@observers.delete(observer)
	end

	def notify_observers(temp, humidity, pressure)
		@observers.each do |observer|
			observer.update(temp, humidity, pressure) # ??? Send attributes or the object ?
		end
	end
end

module Observer
	def update(temp, humidity, pressure)
		puts "Temp: #{temp}, Humidity: #{humidity}, Pressure: #{pressure}"
	end
end

class WeatherData
	include Subject
	attr_writer :temp, :humidity, :pressure

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
		notify_observers(@temp, @humidity, @pressure)
	end 

	def set_measurements
		@temp = get_temperature
		@humidity = get_humidity
		@pressure = get_pressure

		measurements_changed()
	end
end

class CurrentConditionsDisplay
	include Observer
	attr_writer :temp, :humidity, :pressure

	def initialize(subject)
		@subject = subject.register_observer(self)
	end
end

class StatisticsDisplay
	include Observer

	def initialize(subject)
		@subject = subject.register_observer(self)
	end
end

class ForecastDisplay
	include Observer

	def initialize(subject)
		@subject = subject.register_observer(self)
	end
end

weather = WeatherData.new
current_conditions = CurrentConditionsDisplay.new(weather)
statistics_display = StatisticsDisplay.new(weather)
forecast_display = ForecastDisplay.new(weather)

weather.set_measurements()

p weather
