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
	def open_menu
		try Proc.new{|el| touch el.selector },home_button,Proc.new{|el| element_exists(el.selector) },signin_button
	end
	def close_menu
		try Proc.new{|el| touch el.selector },home_button,Proc.new{|el| element_does_not_exist(el.selector) },signin_button
	end
	def toggle_menu
		wait_for(:timeout => 2){touch home_button.selector}
	end
	def toggle_menu_sign_in
		open_menu
		touch signin_button.selector
	end
	def logged_out?
		open_menu
		if !query(signin_button.selector).empty?
			close_menu
			return true
		end
		close_menu
		return false
	end
end
