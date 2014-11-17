module PageObjectModel
  class UserLibraryTopNavSection < PageObjectModel::Page
    #trait "TextView text:'blinkbox'"
    trait "ImageButton index:0"
    element :toggle_button, "ImageButton index:0"
    element :refresh_button, "* id:'action_sort'"
    element :shop_button, "* id:'action_shop'"
  end

  def refresh_library
    refresh_button.touch
  end

  def goto_shop
    shop_button.touch
  end
end