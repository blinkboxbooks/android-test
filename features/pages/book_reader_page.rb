module PageObjectModel
  class BookReaderPage < PageObjectModel::Page
    trait "FrameLayout id:'content'"
    element :bookmarker, "ImageView marked:'Reader bookmark'"
    element :bookmark, "* id:'imageview_bookmark'"
    element :options, "* id:'button_options'"
    #TODO: Reading Options menu should be defined as a section or separate page

    @@forward_tapping_point = {x: 90, y: 50}
    @@backward_tapping_point = {x: 10, y: 50}
    @optionsDisplayed = false
    def turn_pages(number_of_pages)
      point = number_of_pages.to_i >= 0 ? @@forward_tapping_point : @@backward_tapping_point
      (number_of_pages.to_i.abs).times { tap(point[:x], point[:y]) }
    end

    def toggle_reader_options
      tap(50, 50)
      if !@optionsDisplayed
        @optionsDisplayed = true
        options.exists?
      else
        @optionsDisplayed = false 
      end
    end

    def open_options_menu
        #This waiting for trait is due to the reader page having loaded but 
        #the content is asynchronous
        Element.new("* id:'webview_reader'").wait_for_element_exists(timeout: 10) 
        toggle_reader_options
    end

    def toggle_bookmark
      wait_for(:timeout => 5) {
        bookmarker.touch
      }
    end

    #TODO: should check for visibility not only existence?
    def has_bookmark?
      bookmark.exists?
    end

    def has_options?
      options.exists?
    end
  end

  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
