module PageObjectModel
  module PageActions
    def tap_on_saved_card
      user_library_page.user_library_saved_card_popup.payment_card_number.touch
    end

    def tap_on_pay_now_button
      user_library_page.user_library_payment_confirmation_popup.pay_now_button.touch
    end

    def tap_on_goto_my_library_button
      user_library_page.new_book_downloading_popup.goto_my_library_button.touch
    end

    def choose_to_purchase_with_new_card
      shop_page.add_new_card_button.touch
    end

    def choose_not_save_card
       shop_page.enter_card_details_popup.save_details_switch.touch
    end

    def pay_with_a_new_card(card_type, card_details_storage)
      choose_to_purchase_with_new_card
      wait_for{ expect(shop_page).to have_enter_your_card_details_popup }
      choose_not_save_card if card_details_storage.include?('not to')
      enter_card_details(card_type)
      shop_page.enter_card_details_popup.next_button.scroll_to
      shop_page.enter_card_details_popup.next_button.touch
    end

    #needs to be revisited
    def enter_card_details(card_type)
      card_type = card_type.delete(' ').downcase
      card_number = test_data['payment']["#{card_type}"]
      expiry_month = test_data['payment']['expiry_month']
      expiry_year = test_data['payment']['expiry_year']
      security_code = test_data['payment']['expiry_year']
      name_on_card = test_data['payment']['name_on_card']
      address_line_one = test_data['payment']['address_line_one']
      address_line_two = test_data['payment']['address_line_two']
      town_or_city = test_data['payment']['town_or_city']
      postcode = test_data['payment']['postcode']
      shop_page.fill_in_card_details(card_number, expiry_month, expiry_year, security_code, name_on_card)
      shop_page.fill_in_address_details(address_line_one, address_line_two, town_or_city, postcode)
    end
  end
end