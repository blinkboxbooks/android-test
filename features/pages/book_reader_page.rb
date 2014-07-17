module PageObjectModel
  class BookReaderPage < PageObjectModel::Page
    trait "FrameLayout id:'content'"
    element :bookmarker, "ImageView marked:'Reader bookmark'"
    element :bookmark, "* id:'imageview_bookmark'"

    def display_reader_options
      tap 50, 50
    end

    def remove_reader_options
      tap 50, 50
    end

    def turn_page_forward(number_of_pages)
      number_of_pages.to_i.times do
        tap 90, 50
      end
    end

    def turn_page_backward(number_of_pages)
      number_of_pages.to_i.times do
        tap 10, 50
      end
    end

    def options_menu_button
      logger.debug "Opening options menu"
      display_reader_options
      sleep(2)
    end

    def add_bookmark
      wait_for(:timeout => 5) {
        bookmarker.click
      }
    end

    def remove_bookmark
      wait_for(:timeout => 5) {
        bookmarker.click
      }
    end

    def has_bookmark?
      bookmark.exists?
    end
  end


  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
