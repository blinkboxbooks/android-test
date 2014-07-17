
module Navigation
	extend Logging
	def try action, withelement, should_produce, with
		logger.debug "Trying... #{withelement.selector}"
		action.call(withelement)
		t1 = Time.now
		max_time = 5.0
		current_time = 0.0
		has_completed = false
		while (current_time < max_time) && !has_completed
			has_completed = should_produce.call(with)
			current_time = Time.now - t1
			return if has_completed
		end
		raise "Timed out waiting for should_produce => #{with.to_s}"
	end
end

class Element < CalabashElementMethods
	def initialize selector
		super selector
	end
	def method_missing(method, *args, &block)
		super.send(method,args,block)
	end
end

class Page < CalabashPageMethods
	include Logging
	include Navigation
	def method_missing(method, *args, &block)
		super.send(method,args,block)
	end
	def Page.trait selector
		class_eval %Q{
			def trait
				"#{selector}"
			end
		}
	end
	def Page.element identity, selector
		class_eval %Q{
			def #{identity}
				@_#{identity} ||= Element.new("#{selector}")
			end
		}
	end
	def initialize(world)
		super(world)
		logger.debug "Initializing page => #{self.class.to_s}"
	end
end
