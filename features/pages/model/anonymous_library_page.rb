class AnonymousLibraryPage < Page
	@home_button = Element.new("* id:'togglebutton_home'")
	@signin_button = Element.new("TextView marked:'Sign in'")
	@shop_button = Element.new("* id:'button_shop'")
	def trait
		"BBBTextView id:'textview_title'"
	end
	def goto_shop
		@shop_button.click
	end
	def toggle_menu
		@home_button.click
	end
	def toggle_menu_sign_in
		toggle_menu
		@signin_button.click
	end
	def logged_out?
		toggle_menu
		if @signin_button.exists?
			toggle_menu
			return true
		end
		toggle_menu
		return false
	end
end
