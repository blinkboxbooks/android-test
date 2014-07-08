require 'calabash-android/abase'
include Calabash::Android::Operations
module Navigation
	def scroll_with? scroll_direction,element_query, max_duration
		t1 = Time.now
		time = 0
		while !element_exists(element_query) && (time < max_duration)
			performAction(scroll_direction)
			if element_exists(element_query)
				return true
			end
			time = Time.now - t1
		end
		if time > max_duration
			logger.warn "Could not find element in #{max_duration}s"
			return false
		end
		return false
	end
	def scroll_down_with element_query, max_duration
		scroll_with? 'scroll_down', element_query, max_duration
	end
	def scroll_up_with element_query, max_duration
		scroll_with? 'scroll_up', element_query, max_duration
	end
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
	class Element
		attr_reader :selector
		def initialize selector
			@selector = selector
		end
		def attributes
			query(@selector)
		end
		def exists?
			!query(@selector).empty?
		end
		def has_attribute?(attr)
			attributes.has_key?(attr)
		end
	end
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
		def initialize(world, transition_duration=0.5)
			super(world,transition_duration)
			logger.debug "Initializing page => #{trait}"
		end
		def displayed?
			self.current_page?
		end
	end
