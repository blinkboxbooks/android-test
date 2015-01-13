module PageObjectModel
  class UserLibraryTopNavSection < PageObjectModel::Page
    trait "ImageButton index:0"
    element :toggle_button, "ImageButton index:0"
    element :refresh_button, "* id:'action_sort'"
    element :shop_button, "* id:'action_shop'"
  end
end
