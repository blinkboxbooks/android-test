Feature: Allow the user to use the library to view free and purchased books

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page

  @smoke @production
  Scenario Outline: I am able to open a book and flip through
    Given I open the first book
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I go back
    Then the user library should be displayed

  Examples:
    | fpages | bpages |
    | 1      | 1      |

