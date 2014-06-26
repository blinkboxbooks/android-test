require 'calabash-android/abase'

class BBBPage < Calabash::ABase
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
