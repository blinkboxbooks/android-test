require 'calabash-android/abase'

module NavigationHelpers
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
end


module Element
	include Calabash::Android::Operations
	attr_reader :mapped_items
	def add_to_mapped_items(item)
    @mapped_items ||= []
    @mapped_items << item.to_s
  end
	def ext_exists? name,pattern
		method_name = "#{name.to_s}.exists?"
      define_method method_name do |*runtime_args|
          !query(pattern).empty?
        end
	end
	def build_extension_methods(name, arg)
			ext_exists? name, args
	end
 	def build(name, pattern)
    if pattern.empty?
      raise 'No selector'
    else
      add_to_mapped_items name
      yield
    end
		build_extension_methods name,pattern
  end
	def element(element_name, pattern)
		build element_name, pattern do
		define_method element_name.to_s do |*runtime_args|
        query(pattern)
      end
		end
	end
end

class Page < Calabash::ABase
	include NavigationHelpers
	include Logging
	extend Element
	def initialize(world, transition_duration=0.5)
		super(world,transition_duration)
		logger.debug "Navigating page #{trait}"
	end
	def displayed?
		logger.debug "Checking if \"#{trait}\" displayed"
		exists = false
		if !query(trait).empty?
			logger.debug "Found trait"
			exists = true
		end
		return exists
	end
end
