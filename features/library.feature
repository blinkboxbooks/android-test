Feature: Navigating the user library screen

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then the user_library should be displayed

  @smoke
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed
