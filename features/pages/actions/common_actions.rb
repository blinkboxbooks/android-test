module PageObjectModel
  module PageActions
    def expect_page(page)
      page.await
      expect(page).to be_displayed
    rescue => e
      raise RSpec::Expectations::ExpectationNotMetError, "Page verification failed\n   Expected page: '#{page.class.to_s.demodulize}' with trait \"#{page.trait}\"\n \nTimeout: #{e.message}"
    end

    def enter_app_as_anonymous_user
      welcome_page.try_it_out if welcome_page.displayed?
      anonymous_library_page.await
    end

    def enter_app_as_existing_user
      return if user_library_page.displayed?

      if welcome_page.displayed?
        welcome_page.sign_up
      elsif anonymous_library_page.displayed?
        anonymous_library_page.open_menu_and_signin
      end
      sign_in_page.await
      username = test_data['users']['existing']['emailaddress']
      password = test_data['users']['existing']['password']
      sign_in_page.submit_sign_in_details(username, password)
      user_library_page.await
    end
  end
end
