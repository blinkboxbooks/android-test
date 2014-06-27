class UserLibraryPage < BBBPage

  def trait
    "BBBTextView marked:'Your library'"
  end
  def goto_shop
	 touch(" * id:'button_shop'") 
  end
end
