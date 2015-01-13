module PageObjectModel
  module ReaderActions
    def wait_for_book_reader_page
      if book_reader_page.help_overlay.visible?#has_help_overlay?
        book_reader_page.help_overlay.touch
      end
      expect_page(book_reader_page)
    end
  end
end

World(PageObjectModel::ReaderActions)




