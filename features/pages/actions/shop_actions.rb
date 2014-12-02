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
  end
end

World(PageObjectModel::ShopActions)
