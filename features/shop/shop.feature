Feature: I want to search and purchase titles from the shop

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    Then I am on the My Library page
    And I touch the shop icon

  @production
  Scenario Outline: Search suggestions appear when user enters more than 1 character into the search field
    When I enter <query> as the search term
    Then I should see <query> in the search suggestions

  Examples:
    | query         |
    | Bob Marley    |
    | Michael Palin |