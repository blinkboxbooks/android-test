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

    def about_for_first_book
      user_library_page.from_options_menu_choose("About")
      wait_for_about_this_book_page
    end

    def wait_for_about_this_book_page
      expect_page(about_this_book_page)
    end

    def user_purchase_first_book
      user_library_page.from_options_menu_choose("Buy full ebook")
    end

    def verify_purchased_book_in_library
      prev_book_title = shop_page.book_label_text
      about_for_first_book
      about_this_book_page.get_book_title
      expect(prev_book_title).to match(about_this_book_page.book_label_text)
    end

    def goto_user_library_tab(user_option)
      case user_option
        when "Reading"
          user_library_page.goto_reading_tab
        when "My Library"
          user_library_page.goto_my_library_tab
        else
          fail "Unsupported button '#{negate}' in the User library area"
      end
    end

    def open_first_book_in_user_library(library_section)
      goto_user_library_tab(library_section)
      user_library_page.open_first_book
      wait_for_book_reader_page
    end

    def capture_book_details_on_about_this_book
      user_library_page.from_options_menu_choose("About")
      expect_page(about_this_book_page)
      @book_title = about_this_book_page.book_title.text
      puts "Captured book title...#{@book_title}"
      @book_author = about_this_book_page.book_author.text
      puts "Captured book author...#{@book_author}"
    end
  end
end

World(PageObjectModel::UserLibraryActions)
