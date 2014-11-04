@smoke @production
Feature: Sign in/out into blinkbox books

  Background: Deregister devices for an existing user
    Given a valid user account ready for use on a new device

  Scenario: Existing user successfully signs in
    Given the anonymous library screen is displayed
    When I navigate to the Sign in page
    And I submit valid sign in details
    Then the user library page should be displayed
    And I should see sign out option in the drawer menu

  Scenario: User successfully signs out
    Given I am signed in as an existing user
    When I use drawer menu to sign out
    Then the sign in page should be displayed

  Scenario Outline: Sign in with invalid email or password
    Given the anonymous library screen is displayed
    When I navigate to the Sign in page
    When I try to sign in with <invalid_credentials>
    Then sign in is not successful
    And I see the Oops! and invalid email address and password error messages
    And the Reset password button is displayed

  Examples:
    | invalid_credentials          |
    | not registered email address |
    | wrong password               |

