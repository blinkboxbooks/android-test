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
  end
end

World(PageObjectModel::ReaderActions)




