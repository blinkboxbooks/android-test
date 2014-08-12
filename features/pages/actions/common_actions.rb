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
    def enter_app_as_existing_user
      if anonymous_library_page.logged_out?
        anonymous_library_page.open_menu_and_signin
        sign_in_page.await
        username = test_data['users']['existing']['emailaddress']
        password = test_data['users']['existing']['password']
        sign_in_page.submit_sign_in_details(username, password)
      end
    end
  end
end
