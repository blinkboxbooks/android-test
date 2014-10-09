Feature: Sign in/out into blinkbox books

  Background: Existing user sign in/out
    Given a valid user account ready for use on a new device

  @smoke @production
  Scenario: Existing user successfully signs in
    Given the anonymous library screen is displayed
    When I navigate to the Sign in page
    And I submit valid sign in details
    Then the user library should be displayed
    And I should see sign out option in the drawer menu

  @smoke @production
  Scenario: User successfully signs out
    Given the anonymous library screen is displayed
    And I am signed in as an existing user
    And I am on the User Library page
    Then I use drawer menu to sign out
