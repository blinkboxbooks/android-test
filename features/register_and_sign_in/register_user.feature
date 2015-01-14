Feature: Register a new Blinkbox books user
  As a guest user of Blinkbox books
  I want to sign up
  So that I can buy and read books

  Background:
    Given I choose to register via the the Welcome Screen

  @ALA-1869 @ALA-1900 @smoke-qa
  Scenario: Happy path-register user from the Welcome Screen
    When I enter valid registration details
    And I accept terms and conditions
    When I submit registration details
    Then the my library page should be displayed
    When I open the drawer menu
    Then I can see my name in the menu

  @production @ALA-1869 @ALA-1900
  Scenario: Happy path register user with a valid club card number
    When I enter personal details with a valid clubcard number
    And I choose a valid password
    And I submit registration details by accepting terms and conditions
    Then the my library page should be displayed
    When I open the drawer menu
    Then I can see my name in the menu

  @negative
  Scenario: Submit registration details with already existing email address
    When I enter email address already registered to BlinkboxBooks
    And I submit registration details by accepting terms and conditions
    Then email already registered message is displayed
    And registration is not successful
    Then sign in with this email button is displayed

  @negative
  Scenario: Submit registration details without accepting blinkbox books terms and conditions
    When I enter valid registration details
    And I submit registration details by not accepting terms and conditions
    Then registration is not successful
    And please accept T&C condition message is displayed

  @negative
  Scenario: Submit registration details when passwords not matching
    When I enter valid registration details
    And type passwords that are not matching
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And password don't match message is displayed

  @negative
  Scenario: Submit registration details with password less than 6 characters
    When I enter valid registration details
    And type passwords that are less than 6 characters
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And the invalid password message is displayed

  @negative
  Scenario: Submit registration details with invalid clubcard number
    When I enter personal details with a invalid clubcard number
    And I choose a valid password
    And I submit registration details by accepting terms and conditions
    Then registration is not successful
    And the invalid clubcard message is displayed
