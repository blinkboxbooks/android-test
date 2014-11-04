@smoke
Feature: Search results
  Search valid book name, author name and verify search result is displayed

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page

  Scenario Outline: Navigating through the app on the device
    Given I touch the shop icon
    Then I should see the shop page
    When I enter "<shopitem>" as the search term
    Then I should see search suggestions
    And I should see the "<shopitem>" in the search suggestions

  Examples:
    | shopitem                |
    | Malcolm Gladwell        |
    | A Brief History Of Time |

