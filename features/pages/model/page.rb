
module Navigation
	def try perform_action, withelement, should_produce, with
		perform_action.call(withelement)
		wait_for({:timeout => 10, #maximum number of seconds to wait
			:retry_frequency => 0.2, #wait this long before retrying the block
			:post_timeout => 0.1, #wait this long after the block returns true
			:timeout_message => "Timed out waiting...", #error message in case options[:timeout] is exceeded
			:screenshot_on_error => true # take a screenshot in case of error
			}) {
				should_produce.call(with)
			}
		end
	end

	class Element < CalabashMethods
		def initialize selector
			super @selector
		end
		def method_missing(method, *args, &block)
			super.send(method,args,block)
		end
	end

	class Section
		attr_reader :members
		def initialize element_kvp
			@members = Hash[ element.kvp { |identity, selector| [identity,Element.new("#{selector}")] } ]
		end
	end

	require 'calabash-android/abase'
	class Page < Calabash::ABase
		extend Logging
		include Navigation

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
		def Page.section identity,element_kvp
			class_eval %Q{
				def #{identity}
					@_#{identity} ||= Section.new(#{element_kvp})
				end
			}
		end
		def initialize(world, transition_duration=0.5)
			super(world,transition_duration)
			logger.debug "Initializing page => #{self.class.to_s}"
		end
		def displayed?
			self.current_page?
		end
	end
