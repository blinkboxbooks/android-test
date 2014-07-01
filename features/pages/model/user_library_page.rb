class UserLibraryPage < Page
	def initialize arg
		@shop_button = Element.new("* id:'button_shop'")
	end
	def trait
		"BBBTextView marked:'Your library'"
	end
	def goto_shop
		@shop_button.click
	end
end
