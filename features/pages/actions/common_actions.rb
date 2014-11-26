module PageObjectModel
  module PageActions
    def expect_page(page)
      page.await
      expect(page).to be_displayed
    rescue => e
      raise RSpec::Expectations::ExpectationNotMetError, "Page verification failed\n   Expected page: '#{page.class.to_s.demodulize}' with trait \"#{page.trait}\"\n \nTimeout: #{e.message}"
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
  end
end
