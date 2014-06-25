class WelcomePage < BBBPage

  def trait
    "Button marked:'Try it out'"
  end
  def displayed?
	if element_exists(lookup_table('login','el_tryout'))
		return true
	end
	return false
  end
  def try_application_out
    touch("BBBButton marked:'Try it out'") if element_exists("BBBButton marked:'Try it out'")
    page(AnonymousLibraryPage).await
  end

end
