class AnonymousLibraryPage < Page

	trait "BBBTextView id:'textview_title'"
	element :home_button, "* id:'togglebutton_home'"
	element :signin_button, "TextView marked:'Sign in'"
	element :shop_button, "* id:'button_shop'"
	element :your_library_label, "* marked:'Your library'"

	def goto_shop
		touch shop_button.selector
	end
	def open_menu
		try Proc.new{|el| touch el.selector },
		home_button,
		Proc.new{|el| return element_exists(el.selector) },
		signin_button
	end
	def close_menu
		try Proc.new{|el| touch el.selector },
		home_button,
		Proc.new{|el| return element_does_not_exist(el.selector) },
		signin_button
	end
	def toggle_menu_sign_in
		open_menu
		touch signin_button.selector

	end
	def logged_out?
		!your_library_label.exists?
	end
end
