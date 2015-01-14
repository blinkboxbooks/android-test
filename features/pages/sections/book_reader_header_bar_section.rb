module PageObjectModel
  class BookReaderPageHeaderSection < PageObjectModel::Page
    element :header_bar, "* id:'toolbar'"
    element :back_button, "* id:'toolbar' android.widget.ImageButton contentDescription:'Navigate up'"
    element :button_options, "android.widget.ImageView contentDescription:'More options'"
    element :add_bookmark_button, "* id:'action_add_bookmark'"
    element :remove_bookmark_button, "* id:'action_remove_bookmark'"
    element :settings_button, "* id:'action_settings'"
  end
end
