Feature: I want to search and purchase titles from the shop

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed
    Given I touch the shop icon
    Then the shop should be displayed

  Scenario Outline: Search suggestions appear when user enters more than 1 character into the search field
    Given I enter <entry> as the search term
    Then I should see search suggestions

  Examples:
    | entry           |
    | "Bob Marley"    |
    | "Michael Palin" |
