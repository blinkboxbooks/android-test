@production @demo
Feature: I want to demonstrate what an automation framework looks like in operation

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page

  Scenario Outline: Navigating through the app on the device
    Given I touch the shop icon
    Then I should see the shop page
    When I enter <shopitem> as the search term
    Then I should see search suggestions
    And I go back
    And I go back
    When I open the first book
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I go back
    Then the user library should be displayed

  Examples:
    | shopitem | fpages | bpages |
    | "Robots" | 10     | 10     |

