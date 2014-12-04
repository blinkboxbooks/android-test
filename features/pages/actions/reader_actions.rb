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
  end
end

World(PageObjectModel::ReaderActions)




