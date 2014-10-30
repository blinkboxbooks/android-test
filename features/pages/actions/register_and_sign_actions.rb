module PageModels
  module RegisterAndSigninActions
    def click_register_button
      sign_in_page.wait_for_register_button
      sign_in_page.register_button.click
    end

    def enter_sign_in_details(email_address, password)
      sign_in_page.sign_in_form.email.set email_address
      sign_in_page.show_password.set(true)
      sign_in_page.sign_in_form.password.set password
    end

    def submit_sign_in_details(email_address, password)
      sign_in_page.wait_for_sign_in_form
      sign_in_page.wait_until_sign_in_form_visible
      sign_in_page.sign_in_form.submit(email_address, password)
    end

    def enter_personal_details(email_address=@email_address)
      expect_page_displayed('Register')
      email_address ||= generate_random_email_address
      first_name = generate_random_first_name
      last_name = generate_random_last_name
      register_page.fill_in_personal_details(first_name, last_name, email_address)
      return email_address, first_name, last_name
    end

    def enter_password(value)
      register_page.fill_in_password(value)
    end

    def supply_new_password(current_password, new_password, reenter_new_password)
      form = change_password_page
      form.current_password.set(current_password)
      form.enter_new_password.set(new_password)
      form.re_enter_new_password.set(reenter_new_password)
      form.confirm_button.click
    end

    def enter_password_signin_page(value)
      sign_in_page.sign_in_form.fill_in_password(value)
    end

    def update_password(current_password, new_password, re_enter_password = new_password, args = {:submit => false})
      change_password_page.current_password.set current_password
      change_password_page.enter_new_password.set new_password
      change_password_page.re_enter_new_password.set re_enter_password
      change_password_page.confirm_button.click if args[:submit]
    end

    def click_sign_in_button
      sign_in_page.sign_in_form.click_sign_in_button
    end

    def navigate_to_sign_in_form
      sign_in_page.load
    end

    def navigate_to_register_form
      navigate_to_sign_in_form
      sign_in_page.register_button.click
    end

    def accept_terms_and_conditions(accept_terms)
      register_page.terms_and_conditions.set(accept_terms)
    end

    def submit_registration_details
      register_page.register_button.click
      puts "Email address used for user registration: #{@email_address}, #{@first_name} #{@last_name}"
      #registration_success_page.wait_for_welcome_label || register_page.wait_for_errors_section
    end

    def register_new_user(provide_clubcard = 'without', clubcard_number = '')
      @password = test_data('passwords', 'valid_password')
      @email_address, @first_name, @last_name = enter_personal_details
      enter_password(@password)
      register_page.fill_in_club_card(clubcard_number) if provide_clubcard.eql?('with')
      accept_terms_and_conditions(true)
      submit_registration_details
      puts "Email address used for user registration: #{@email_address}, #{@first_name} #{@last_name}"
      return @password, @email_address, @first_name, @last_name
    end

    def register_with_existing_email_address
      @email_address, @first_name, @last_name = enter_personal_details(test_data('emails', 'happypath_user'))
      enter_password(test_data('passwords', 'valid_password'))
      accept_terms_and_conditions(true)
      submit_registration_details
    end

    def sign_in(email_address=@email_address, password=@password)
      if email_address.nil?
        email_address = test_data('emails', 'user_with_devices')
        @first_name = test_data('name', 'user_with_devices')
      end
      password ||= test_data('passwords', 'valid_password')
      if logged_in_session?
        raise 'User is already signed in, which is not expected, please check your flow'
      else
        navigate_to_sign_in_form
        submit_sign_in_details(email_address, password)
      end
      puts "Email address used for user sign-in: #{email_address}"
    end

    def set_email_and_password(email_address, password)
      @email_address = email_address
      @password = password
    end

    def enter_not_matching_passwords
      register_page.password.set test_data('passwords', 'valid_password')
      register_page.password_repeat.set test_data('passwords', 'not_matching_password')
    end

    def cancel_registration
      register_page.cancel_registration.click
    end

    def confirm_cancel_registration
      register_page.wait_until_cancel_registration_popup_visible
      register_page.confirm_cancel_registration.click
    end

    def sign_out_and_start_new_session
      your_account_page.sign_out_button.click
      home_page.load
    end

    def sign_in_from_redirected_page
      set_email_and_password(test_data('emails', 'no_expired_cards'), test_data('passwords', 'valid_password')) if @email_address.nil?
      assert_page('sign in page')
      sign_in_page.sign_in_form.submit(@email_address, @password)
    end

    def click_forgotten_password_link
      sign_in_page.wait_for_forgotten_password_link
      sign_in_page.forgotten_password_link.click
    end

    def click_send_reset_link
      reset_password_page.send_reset_link.click
    end
  end
end
World(PageModels::RegisterAndSigninActions)


