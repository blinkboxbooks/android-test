Feature: Register a new Blinkbox books user
  As a guest user of Blinkbox books
  I want to sign up
  So that I can buy and read books

  @smoke
  Scenario: Happy path-register user from the Welcome Screen
    Given I choose to register via the the Welcome Screen
    When I enter valid personal details
    And I choose a valid password
    And I accept terms and conditions
    And I submit registration details
    Then the user library should be displayed
    When I open the drawer menu
    Then I can see my name in the menu

  @smoke
  Scenario: Happy path register user with a valid club card number
    Given I choose to register via the the Welcome Screen
    When I enter personal details with valid clubcard number
    And I choose a valid password
    And I submit registration details by accepting terms and conditions
    Then the user library should be displayed
    When I open the drawer menu
    Then I can see my name in the menu