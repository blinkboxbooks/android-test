Feature: Sign in/out into blinkbox books

  Background: Existing user sign in/out
    Given a valid user account ready for use on a new device

  @smoke
  Scenario: Existing user successfully signs in
    Given the anonymous library screen is displayed
    When I navigate to the Sign in page
    And I submit valid sign in details
    Then the User Library page should be displayed
    And I should see sign out option in the drawer menu

  @smoke
  Scenario: User successfully signs out
    Given the anonymous library screen is displayed
    And I am signed in as an existing user
    And I am on the User Library page
    When I use drawer menu to sign out
    Then the Sign in page should be displayed
    When I go back to the Anonymous Library page
    Then I should see sign in option in drawer menu
