require 'logger'
module Logging
	class MultiDelegator
		def initialize(*targets)
			@targets = targets
		end

		def self.delegate(*methods)
			methods.each do |m|
				define_method(m) do |*args|
					@targets.map { |t| t.send(m, *args) }
				end
			end
			self
		end

		class <<self
			alias to new
		end
	end

	class PreLog
		attr_accessor :logger
		def initialize level
			@logger ||= Logger.new MultiDelegator.delegate(:write,:close).to(STDOUT)
			@logger.level = level ? level : Logger::DEBUG
		end
	end
	def logger_set_level(level)
		@logger.level = level
	end
	def logger level = Logger::DEBUG
		@logger ||= PreLog.new(level).logger
	end
end
