module PageModels
  module RegisterAndSigninActions
    def enter_app_as_anonymous_user
      welcome_page.try_it_out if welcome_page.displayed?
      dismiss_info_panel
    end

    def enter_app_as_existing_user
      enter_app_as(test_data['users']['existing']['emailaddress'], test_data['users']['existing']['password'])
    end

    def enter_app_as_existing_user_with_a_card
      enter_app_as(test_data['users']['withcard']['emailaddress'], test_data['users']['withcard']['password'])
    end

    def enter_app_as(username, password)
      if welcome_page.displayed?
        welcome_page.sign_up
      elsif my_library_page.displayed?
        my_library_page.open_menu_and_signin
      end
      sign_in_page.await
      sign_in_page.submit_sign_in_details(username, password)
      dismiss_info_panel
    end

    def dismiss_info_panel
      expect_page(my_library_page)
      my_library_page.dismiss_info_panel
    end

    def register_via_welcome_screen
      welcome_page.sign_up
      click_register_button
    end

    def click_register_button
      sign_in_page.await
      sign_in_page.register
    end

    def submit_sign_in_details(email_address, password)
      sign_in_page.submit_sign_in_details(email_address, password)
    end

    def enter_personal_details(email_address = @email_address)
      expect_page(register_page)
      email_address ||= generate_random_email_address
      first_name = generate_random_first_name
      last_name = generate_random_last_name
      register_page.fill_in_personal_details(first_name, last_name, email_address)
      return email_address, first_name, last_name
    end

    def enter_password(value)
      register_page.fill_in_password(value)
    end

    def set_terms_and_conditions(accept_terms)
      register_page.set_terms_and_conditions(accept_terms)
    end

    def submit_registration_details
      register_page.register_button.scroll_to
      register_page.register_button.touch
      puts "Details used for user registration: #{@email_address}, #{@first_name} #{@last_name}"
    end
  end
end

World(PageModels::RegisterAndSigninActions)
