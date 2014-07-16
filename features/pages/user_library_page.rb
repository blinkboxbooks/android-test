class UserLibraryPage < Page
	trait	"BBBTextView marked:'Your library'"
	element :shop_button, "* id:'button_shop'"

	def goto_shop
		shop_button.click
	end
end
