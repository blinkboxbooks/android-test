module PageObjectModel
  class AboutThisBookPage < PageObjectModel::Page
    attr_accessor :book_label_text
    trait "android.widget.TextView text:'About this book'"
    element :book_cover, "* id:'bookcover'"
    element :book_title, "* id:'textview_title'"
    element :book_author, "* id:'textview_author'"
    element :book_publisher, "* id:'textview_published'"
    element :book_description, "* id:'textview_description'"
    element :view_more_books_button, "* id:'button_openshop' text:'View more books in the shop'"

  def get_book_title
    @book_label_text = book_title.text
  end
  end
end

module PageObjectModel
  def about_this_book_page
    @_about_this_book_page ||= page(AboutThisBookPage)
  end
end
