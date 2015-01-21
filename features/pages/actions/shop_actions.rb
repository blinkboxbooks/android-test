module PageObjectModel
  module ShopActions
    def download_free_sample_from_shop_highlights(book_name)
      shop_page.click_highlights_until(book_name)
      #expect(shop_page.book_title_text.text).to match(book_name)
      shop_page.shop_highlights.carousel.touch
      shop_page.pop_up_container.wait_for_element_exists(timeout: 5)
      expect(shop_page.pop_up_book_title_text.text).to match(book_name)
      #ensure the popup contains the string sample.
      #tap_when_present
      shop_page.get_free_sample_button.touch
      shop_page.download_button.tap_when_element_exists(timeout: 5)
    end

    def open_the_first_bookcover_from_shop
      shop_page.bookcover_first.tap_when_element_exists(timeout: 5)
    end

    def capture_book_details_on_book_description_screen
      open_the_first_bookcover_from_shop
      expect_page(shop_book_description_page)
      shop_book_description_page.get_book_and_author_details
    end

    def open_book_and_click_on_author_link
      capture_book_details_on_book_description_screen
      shop_book_description_page.author_link.touch
      expect_page(shop_author_details_page)
    end

    def goto_shop_and_navigate_to_tab(category)
      navigate_to_shop_as_anon_user
      shop_page.goto_category(category)
      shop_page.category_is_selected(category)
    end

    def register_and_buy_free_book(category)
      goto_shop_and_navigate_to_tab(category)
      shop_page.select_free_book_for_purchase
      register_via_create_bbb_account_pop_up
      wait_for { expect(shop_page).to have_welcome_to_blinkbox_books_popup }
    end
  end
end

World(PageObjectModel::ShopActions)
