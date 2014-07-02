class AnonymousLibraryPage < Page

	element :home_button, "* id:'togglebutton_home'"
	element :signin_button, "TextView marked:'Sign in'"
	element :shop_button, "* id:'button_shop'"
	def trait
		"BBBTextView id:'textview_title'"
	end
	def goto_shop
		shop_button_click
	end
	def toggle_menu
		home_button_click
	end
	def toggle_menu_sign_in
		toggle_menu
		signin_button_click
	end
	def logged_out?
		toggle_menu
		if signin_button_exists?
			toggle_menu
			return true
		end
		toggle_menu
		return false
	end
end
