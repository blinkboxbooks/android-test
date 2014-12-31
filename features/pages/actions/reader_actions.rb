module PageObjectModel
  module ReaderActions
    def wait_for_book_reader_page
      if book_reader_page.help_overlay.visible?#has_help_overlay?
        book_reader_page.help_overlay.touch
      end
      expect_page(book_reader_page)
    end

    def go_back_to_book_reader_page
      book_reader_my_bookmarks_page.book_reader_static_toolbar.go_up_button.touch unless book_reader_page.webview_reader.exists?
    end

    def verify_last_reading_position
      prev_chapter = book_reader_page.book_chapter
      prev_progress = book_reader_page.book_progress
      book_reader_page.get_header_and_footer_text
      expect(prev_chapter).to match(book_reader_page.book_chapter)
      expect(prev_progress).to match(book_reader_page.book_progress)
    end

    def go_to_end_of_the_book
      book_reader_page.move_slider_to_position(100)
      book_reader_page.close_web_reader_header_and_footer
      book_reader_page.turn_pages(1)
      assert_end_of_book
    end

    def verify_last_reading_position_on_reader_slider
      expect_page(book_reader_page)
      book_reader_page.invoke_web_reader_header_and_footer
      verify_last_reading_position
    end

  end
end

World(PageObjectModel::ReaderActions)




