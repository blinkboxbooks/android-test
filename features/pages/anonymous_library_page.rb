class AnonymousLibraryPage < Page

	trait "BBBTextView id:'textview_title'"
	element :home_button, "* id:'togglebutton_home'"
	element :signin_button, "TextView marked:'Sign in'"
	element :shop_button, "* id:'button_shop'"
	element :your_library_label, "* marked:'Your library'"

	def goto_shop
		shop_button.click
	end
	def open_menu
		try Proc.new{|el| el.click },
		home_button,
		Proc.new{|el| return el.exists? },
		signin_button
	end
	def close_menu
		try Proc.new{|el| el.click },
		home_button,
		Proc.new{|el| return !el.exists? },
		signin_button
	end
	def toggle_menu_sign_in
		open_menu
		signin_button.click
	end
	def logged_out?
		!your_library_label.exists?
	end
end
