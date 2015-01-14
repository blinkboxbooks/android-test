module PageObjectModel
  class EndOfSampleBook < PageObjectModel::Page
    trait "android.widget.TextView text:'That's the end of this sample! Want to know what happens next? Read on!'"
    element :book_cover, "* id:'bookcover'"
    element :book_title, "* id:'textview_book_title'"
    element :book_author, "* id:'textview_book_author'"
    element :book_publisher, "* id:'textview_book_published'"
    element :book_price, "* id:'textview_price_discounted'"
  end
end

module PageObjectModel
  def end_of_sample_book
    @_end_of_sample_book ||= page(EndOfSampleBook)
  end
end
