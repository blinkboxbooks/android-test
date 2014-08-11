Feature: Allow the user to use the library to view free and purchased books

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then the user libary should be displayed

  @smoke
  Scenario Outline: I am able to open a book and flip through
    Given I open the first book
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I go back
    Then the user libary should be displayed

  Examples:
    | fpages | bpages |
    | 1      | 1      |

  @smoke
  @wip
  Scenario Outline: Add and remove bookmarks
    Given I open the first book
    And turn <fpages> pages forward
    And I verify that the page is not bookmarked
    When I open the reading option
    And I add a bookmark to the page
    And I verify that the page is bookmarked
    When I open the reading option
    And I remove the bookmark from the page
    And I verify that the page is not bookmarked
    And turn <bpages> pages backward
    And I go back
    Then the user libary should be displayed
    
    Examples:
    | fpages | bpages |
    | 1      | 1      |
