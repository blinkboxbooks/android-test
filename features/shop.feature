Feature: I want to search and purchase titles from the shop

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page
    And I touch the shop icon

  @smoke @production
  Scenario Outline: Search suggestions appear when user enters more than 1 character into the search field
    When I enter <entry> as the search term
    Then I should see search suggestions

  Examples:
    | entry           |
    | "Bob Marley"    |
    | "Michael Palin" |
