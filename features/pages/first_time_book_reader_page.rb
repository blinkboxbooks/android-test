module PageObjectModel
  class FirstTimeBookReaderPage < PageObjectModel::Page
    trait "* id:'imageview_overlay'"
    element :help_overlay, "* id:'imageview_overlay'"
    element :got_it_button, "* id:'button_thats_it'"
  end
end

module PageObjectModel
  def first_time_book_reader_page
    @_first_time_book_reader_page ||= page(FirstTimeBookReaderPage)
  end
end
