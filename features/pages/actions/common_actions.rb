module PageObjectModel
  module PageActions

    def expect_page(page)
      page.await
      expect(page).to be_displayed
    rescue => e
      raise RSpec::Expectations::ExpectationNotMetError, "Page verification failed\n   Expected page: '#{page.class.to_s.demodulize}' with trait \"#{page.trait}\"\n \nTimeout: #{e.message}"
    end

    def enter_app_as_anonymous_user
      if welcome_page.displayed?
        welcome_page.goto_library
      end
      anonymous_library_page.await
    end

  end
end