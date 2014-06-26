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
			puts "Could not find element in #{max_duration}s"
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

class BBBPage < Calabash::ABase
	include NavigationHelpers
	def displayed?
		puts "Checking if \"#{trait}\" displayed"
		exists = false
		if !query(trait).empty?
			puts "Found trait"
			exists = true
		end
		return exists
	end	
end
