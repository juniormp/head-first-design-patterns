class Logger
	def initialize
		@log = File.open("04-singleton-pattern/log.txt", "a")		
	end

	@@instance = Logger.new 

	def self.instance
		return @@instance	
	end

	def log(msg)
		@log.puts(msg)
	end

	private_class_method :new 
end

Logger.instance.log('Hello !') # getting logger instance and writting on log.txt

require 'singleton'

class LoggerTwo
  include Singleton # Ruby Standard Library has a Singleton module which implements the Singleton pattern

  def initialize
    @log = File.open("04-singleton-pattern/log-two.txt", "a")
  end

  def log(msg)
    @log.puts(msg)
  end
end

LoggerTwo.instance.log('Good bye!') # getting logger instance and writting on log.txt