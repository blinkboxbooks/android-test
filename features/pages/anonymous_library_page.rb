class   AnonymousLibraryPage < BBBPage

  def trait
    "BBBTextView id:'textview_title'"
  end

  def goto_sign_in
  	if query("* marked:'Sign in'").length == 0
		scroll_down_with "* marked:'Sign in'",10
	end
	touch("* marked:'Sign in'")
    @sign_in_page = page(SignInPage).await
  end

  def goto_registration
    touch("")
  end

  def logged_out?
    touch("ToggleButton id:'togglebutton_home'")
    query("TextView marked:'Sign in'").empty?.should == false
    touch("ToggleButton id:'togglebutton_home'")
  end

end
