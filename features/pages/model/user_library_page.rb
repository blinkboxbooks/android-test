class UserLibraryPage < Page
	element :shop_button, "* id:'button_shop'"
	def trait
		"BBBTextView marked:'Your library'"
	end
	def goto_shop
		shop_button.click
	end
end
