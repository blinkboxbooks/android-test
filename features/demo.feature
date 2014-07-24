Feature: I want to demonstrate what an automation framework looks like in operation

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen

  @pad
  Scenario Outline: Navigating through the app on the pad
    Given I touch the shop icon
    Then I should see the shop page
    Then I touch the <bselect> button
    When I enter <shopitem> as the search term
    Then I should see search suggestions
    When I go back
    And I go back
    Then I should be back on the user library screen
    When I open the first book
    And move <fpages> foward
    And move <fpages> backward
    And I go back
    Then I should be back on the user library screen

  Examples:
    | shopitem | fpages | bselect       |
    | "Robots" | 10     | "Non-fiction" |

  @phone
  Scenario Outline: Navigating through the app on the phone
    Given I touch the shop icon
    Then I should see the shop page
    When I enter <shopitem> as the search term
    Then I should see search suggestions
    When I go back
    And I go back
    Then I should see search suggestions
    When I open the first book
    And move <fpages> foward
    And move <fpages> backward
    And I go back
    Then I should be back on the user library screen

  Examples:
    | shopitem | fpages |
    | "Robots" | 10     |
