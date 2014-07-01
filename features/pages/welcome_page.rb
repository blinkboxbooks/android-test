class WelcomePage < BBBPage
  def trait
    "BBBButton marked:'Try it out'"
  end
  def try_application_out
    touch("BBBButton marked:'Try it out'")
    page(AnonymousLibraryPage).await
  end
end
