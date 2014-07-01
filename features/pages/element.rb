require 'calabash-android'
require 'calabash-android/operations'
class Element
	include Calabash::Android::Operations
	attr_accessor :el
	def exists?
		if query(@el).empty?
			return false
		end
		return true
	end
	def initialize(el)
		@el = el
	end
	def click
		touch(@el)
	end
	def enter_text(text)
		performAction('enter_text_into_id_field',text,@el)
	end
end
