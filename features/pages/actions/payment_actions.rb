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
  end
end