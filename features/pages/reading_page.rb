module PageObjectModel
  class ReadingPage < UserLibraryPage
    trait "* id:'sliding_tabs' TextView {text BEGINSWITH 'Reading'} isSelected:true"
    element :reading_book_counter, "* id:'sliding_tabs' TextView {text BEGINSWITH 'Reading'}"

    def current_number_of_books_in_reading
      x = reading_book_counter.text
      x.scan(/\d+/).first.to_i
    end

  end
end

module PageObjectModel
  def reading_page
    @_reading_page ||= page(ReadingPage)
  end
end