class   AnonymousLibraryPage < BBBPage
include LibraryActions
	def trait
		"BBBTextView id:'textview_title'"
	end
	def toggle_menu
		touch("* id:'togglebutton_home'")
	end
	def toggle_menu_sign_in
		toggle_menu
		touch("TextView marked:'Sign in'")
	end
	def logged_out?
		toggle_menu
		if query("TextView marked:'Sign in'").empty?
			toggle_menu
			return false
		end
		toggle_menu
		return true
	end
end
