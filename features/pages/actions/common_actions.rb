module PageObjectModel
  module PageActions
    def expect_page(page)
      page.await(timeout: 15)
      expect(page).to be_displayed
    rescue => e
      raise RSpec::Expectations::ExpectationNotMetError, "Page verification failed\n   Expected page: '#{page.class.to_s.demodulize}' with trait \"#{page.trait}\"\n \nTimeout: #{e.message}"
    end

    def expect_activity(activity)
      wait_for(:timeout => 15 ) { expect(current_activity).to include(activity) }
     rescue => e
      raise RSpec::Expectations::ExpectationNotMetError, "Activity verification failed\n   Expected Activity: '#{activity}' \nTimeout: #{e.message}"
    end

    def expect_text_on_screen(page, message_text, timeout = 5)
      expect_page(page)
      expect_text(message_text, timeout = timeout)
    end

    def expect_text(text, timeout=5)
      begin
        mark = escape_quotes(text)
        wait_for_text("#{mark}", timeout: timeout)
        return true
      rescue
        false
      end
    end

    def tap_on_saved_card
      user_library_page.user_library_saved_card_popup.payment_card_number.touch
    end

    def tap_on_pay_now_button
      user_library_page.user_library_payment_confirmation_popup.pay_now_button.touch
    end

    def tap_on_goto_my_library_button
      user_library_page.new_book_downloading_popup.goto_my_library_button.touch
    end

    #scroll_until_i_see("save 28%",:down), scroll_until_i_see("There's Something I'",:up)
    def scroll_until_i_see(text, direction = :up)
      wait_poll(until_exists: "* {text CONTAINS[c] '#{escape_quotes(text)}'}", timeout: 10) do
        pan("* id:'viewpager'", direction)
      end
    end

    def scroll_and_touch_text(text_to_touch, direction = :up)
      scroll_until_i_see(text_to_touch, direction = :up)
      touch("* marked:'#{text_to_touch}'")
    end
  end
end
