class   AnonymousLibraryPage < BBBPage

  def trait
    "BBBTextView id:'textview_title'"
  end

  def goto_sign_in
    touch("* marked:'Sign in to find books and more'")
    page(SignInPage).await
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

