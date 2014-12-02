module PageObjectModel
  module UserLibraryActions
    def sample_book_is_downloaded_to_my_library(book_name, library_area)
      drawer_menu_page.goto_library(library_area)
      user_library_page.open_first_book_options
      expect(user_library_page.options_menu_book_title.text).to match(book_name)
      expect_text(test_data['options_menu']["#{library_area}"'_delete'])
      press_back_button
    end

    def read_first_book
      user_library_page.from_options_menu_choose("Read")
      wait_for_book_reader_page
    end
  end
end

World(PageObjectModel::UserLibraryActions)
