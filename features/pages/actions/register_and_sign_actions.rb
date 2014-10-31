module PageModels
  module RegisterAndSigninActions
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

    def enter_personal_details(email_address=@email_address)
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

    def accept_terms_and_conditions(accept_terms)
      register_page.set_terms_and_conditions(accept_terms)
    end

    def submit_registration_details
      register_page.register_button.scroll_to
      register_page.register_button.touch
      puts "Details used for user registration: #{@email_address}, #{@first_name} #{@last_name}"
      #registration_success_page.wait_for_welcome_label || register_page.wait_for_errors_section
    end
  end
end

World(PageModels::RegisterAndSigninActions)


