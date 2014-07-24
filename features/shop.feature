Feature: I want to search and purchase titles from the shop

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen
    Given I touch the shop icon
    Then I should see the shop page

  Scenario Outline: Search suggestions appear when user enters more than 1 character into the search field
    Given I enter <entry> as the search term
    Then I should see search suggestions

  Examples:
    | entry           |
    | "Bob Marley"    |
    | "Michael Palin" |
