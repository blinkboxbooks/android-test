module PageObjectModel
  class UserLibraryNewBookDownloadingPopupSection < PageObjectModel::Page
    trait "* id:'content' android.widget.TextView text:'Your new book is downloading'"
    element :new_book_downloading_text, "* id:'textview_header' text:'Your new book is downloading'"
    element :goto_my_library_button, "* id:'button1' text:'Go to my library'"
    element :find_more_books_button, "* id:'button2' text:'Find more books'"
  end
end