module PageObjectModel
  class BookReaderPageDrawerMenuSection < PageObjectModel::Page
    trait "* id:'drawer'"
    element :drawer, "* id:'drawer'"
    element :button_options, "* id:'button_options'"
    element :reading_settings, "* id:'text1' text:'Reading settings'"
    element :table_of_contents, "* id:'text1' text:'Table of contents'"
    element :about_this_book, "* id:'text1' text:'About this book'"
    element :bookmark_this_page, "* id:'text1' text:'Bookmark this page'"
    element :remove_bookmark, "* id:'text1' text:'Remove bookmark'" #you see this on a page you have bookmarked
    element :my_bookmarks, "* id:'text1' text:'My bookmarks'"
    element :goto_shop, "* id:'text1' text:'Go to the shop'"
    element :help, "* id:'text1' text:'Help'"
  end
end
