class   AnonymousLibraryPage < BBBPage
	def trait
		"BBBTextView id:'textview_title'"
	end

	def goto_sign_in
		if query(lookup_table("login","el_goto_signin")).length == 0
			if !scroll_down_with lookup_table("login","el_goto_signin"),10
				puts "Already signed in!"
			else
				touch(lookup_table("login","el_goto_signin"))
			end
		end
		@sign_in_page = page(SignInPage).await
	end

	def goto_registration
		touch("")
	end
	def toggle_menu
		touch(lookup_table('anon','toggle_menu'))
	end
	def toggle_menu_sign_in
		toggle_menu
		touch(lookup_table('anon','toggle_menu_signin'))
	end
	def logged_out?
		touch("ToggleButton id:'togglebutton_home'")
		query("TextView marked:'Sign in'").empty?.should == false
		touch("ToggleButton id:'togglebutton_home'")
	end

end
