@smoke
Feature: Search results
  Search valid book name, author name and verify search result is displayed

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    Then I am on the My Library page

  Scenario Outline: Navigating through the app on the device
    Given I touch the shop icon
    Then I should see the shop page
    When I enter "<query>" as the search term
    Then I should see search suggestions
    And I should see "<query>" in the search suggestions

  Examples:
    | query                   |
    | Malcolm Gladwell        |
    | A Brief History Of Time |

