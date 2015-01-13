module PageObjectModel
  class BookReaderStaticToolbarSection < PageObjectModel::Page
    element :go_up_button, "* id:'toolbar' android.widget.ImageButton"
    element :title, "* id:'toolbar' android.widget.TextView"
  end
end