require 'calabash-android/abase'

class BBBPage < Calabash::ABase
	def initialize
		@valid_elements = query('*').map { |item| {'id' => item['id'], 'class' => item['class']} }	
	end
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
