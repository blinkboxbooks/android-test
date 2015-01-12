@production @ALA-1870 @ALA-1869
Feature: Search results
  Search valid book name, author name and verify search result is displayed

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    Then I am on the My Library page
    When I touch the shop icon
    Then I should see the shop page

  Scenario Outline: Navigating through the app on the device
    When I enter <query> as the search term
    Then I should see search suggestions
    And I should see <query> in the search suggestions

  @sanity-all
  Examples:
    | query                   |
    | A Brief History Of Time |

  Examples:
    | query                   |
    | Malcolm Gladwell        |
    | A Brief History Of Time |

  @sanity-all
  Scenario: Entering some jibberish should show the empty search results page
    When I enter somejibberish as the search term
    And I press enter
    Then the empty search results page should be displayed

  Scenario: Exact match on author name
    When I enter graham mort as the search term
    And I press enter
    Then search results should be displayed
    And the author name of first book displayed should contain graham mort

  Scenario: Exact match on title
    When I enter fifty shades of grey as the search term
    And I press enter
    Then search results should be displayed
    And the title of first book displayed should contain fifty shades of grey

  Scenario: Exact match on ISBN
    When I enter 9780571267064 as the search term
    And I press enter
    Then only one matching search result should be displayed
    And book name should be "Jack Maggs"
    And author name should be "Peter Carey"