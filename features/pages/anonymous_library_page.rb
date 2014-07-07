class AnonymousLibraryPage < Page

	element :home_button, "* id:'togglebutton_home'"
	element :signin_button, "TextView marked:'Sign in'"
	element :shop_button, "* id:'button_shop'"
	def trait
		"BBBTextView id:'textview_title'"
	end
	def goto_shop
		touch shop_button.selector
	end
	def toggle_menu
		touch home_button.selector
	end
	def toggle_menu_sign_in
		toggle_menu
		touch signin_button.selector
	end
	def logged_out?
		  toggle_menu
		if !query(signin_button.selector).empty?
			toggle_menu
			return true
		end
		toggle_menu
		return false
	end
end
