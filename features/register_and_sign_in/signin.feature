@qa @ALA-1869
Feature: Sign in into blinkbox books

  Background: Deregister devices for an existing user
    Given a valid user account ready for use on a new device

  @smoke-qa
  Scenario: Existing user successfully signs in
    Given the My Library screen is displayed
    When I navigate to the Sign in page
    And I submit valid sign in details
    Then the my library page should be displayed
    And I should see sign out option in the drawer menu

  @new_data
  Scenario: New user successfully signs in
    Given the My Library screen is displayed
    When I have registered and signed in as new user
    Then the my library page should be displayed
    And I should see sign out option in the drawer menu

  @production
  Scenario Outline: Sign in with invalid email or password
    Given the My Library screen is displayed
    When I navigate to the Sign in page
    When I try to sign in with an <invalid_credentials>
    Then sign in is not successful
    And I see the Oops! and invalid email address and password error messages
    And the Reset password button is displayed

  @smoke-all
  Examples:
    | invalid_credentials        |
    | unregistered email address |

  Examples:
    | invalid_credentials        |
    | unregistered email address |
    | incorrect password         |