Feature: Allow the user to use the library to view free and purchased books

  Background:
    Given a valid user account ready for use on a new device
    Given the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed

  @disabled
  Scenario Outline: I am able to open a book and flip through
    Given I open the first book
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I go back
    Then the user library should be displayed

  Examples:
    | fpages | bpages |
    | 1      | 1      |

  @unstable
  Scenario Outline: Add and remove bookmarks
    Given I open the first book
    And turn <fpages> pages forward
    When I toggle the reading option
    And verify it exists 
    When I toggle the reading option
    And turn <bpages> pages backward
    And I go back
    Then the user library should be displayed
    
    Examples:
    | fpages | bpages |
    | 25      | 25      |
