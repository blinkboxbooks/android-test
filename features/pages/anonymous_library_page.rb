class AnonymousLibraryPage < Page

	element :home_button, "* id:'togglebutton_home'"
	element :signin_button, "TextView marked:'Sign in'"
	element :shop_button, "* id:'button_shop'"
	element :your_library, "* marked:'Your library'"
	def trait
		"BBBTextView id:'textview_title'"
	end
	def goto_shop
		touch shop_button.selector
	end
	def open_menu
		logger.debug "Opening menu"
		try Proc.new{|el| touch el.selector },
		home_button,
		Proc.new{|el| return element_exists(el.selector) },
		signin_button
	end
	def close_menu
		logger.debug "Close menu"
		try Proc.new{|el| touch el.selector },
		home_button,
		Proc.new{|el| return element_does_not_exist(el.selector) },
		signin_button
	end
	def toggle_menu_sign_in
		open_menu
		wait_for(:timeout => 5){
			element_exists(signin_button.selector)
		}
		touch signin_button.selector
	end
	def logged_out?
		query(your_library.selector).empty?
	end
end
