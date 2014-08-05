Feature: Navigating the user library screen

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen


  @smoke
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then I should see the shop page

  @smoke @wip
  Scenario Outline: Verify the menu option from the embedded books
    Given the anonymous library screen is displayed
    And I click on first embedded book options
    Then I should see the following <OptionMenu>

  Examples:
  |OptionMenu|
  | "Buy the full book" |
  | "About this book" |
  | "See table of contents" |
  | "Read sample" |
  | "Mark sample as ‘Finished'" |
  | "Remove sample from your device" |
