module PageObjectModel
  class WelcomeToBlinkboxBooksPopupSection < PageObjectModel::Page
    trait "* id:'content' android.widget.Textview text:'Welcome to blinkbox Books!'"
    element :welcome_to_blinkbox_books_title, "* id:'textview_header' text:'Welcome to blinkbox Books!'"
    element :goto_my_library_button, "* id:'button1' text:'Go to my library'"
    element :find_more_books_button, "* id:'button2' text:'Find more books'"
  end
end