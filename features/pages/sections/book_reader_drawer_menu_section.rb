module PageObjectModel
  class BookReaderPageMenuSection < PageObjectModel::Page
    trait "android.widget.ListView"
    element :option_menu, "android.widget.ListView"
    element :button_options, "* id:'button_options'"
    element :table_of_contents, "* id:'title' text:'Table of contents'"
    element :about_this_book, "* id:'title' text:'About this book'"
    element :my_bookmarks, "* id:'title' text:'My bookmarks'"
    element :goto_shop, "* id:'title' text:'Go to the shop'"
    element :help, "* id:'title' text:'Help'"
  end
end
