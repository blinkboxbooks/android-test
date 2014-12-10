Feature: Bookmarking
  As a reader I am able to add and remove bookmarks

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And I set the book slider position to 20

  @smoke
  Scenario: I am able to add and remove a bookmark by using delete option in the Book Reader - My bookmarks page
    Given I choose to add a bookmark using the Book Reader page
    And I visit the "My bookmarks" page from the Reader option menu
    Then My bookmarks page should have a bookmark
    When I delete the first bookmark
    Then The Empty Bookmarks page should be seen
    And the Book Reader page should not have a bookmark

  Scenario: I am able to add a bookmark by using the add button via the Book Reader page toolbar
    Given I choose to add a bookmark using the Book Reader page toolbar
    When I visit the "My bookmarks" page from the Reader option menu
    And My bookmarks page should have a bookmark
    Then The bookmarks' details should match the details shown in the Book Reader popup

  Scenario: I am able to remove a bookmark by using the add/remove buttons on the Book Reader page toolbar
    Given I choose to add a bookmark using the Book Reader page
    And I choose to remove a bookmark using the Book Reader page toolbar
    When I visit the "My bookmarks" page from the Reader option menu
    Then The Empty Bookmarks page should be seen

  Scenario: I am able to add/remove a bookmark using the Book Reader page
    Given I choose to add a bookmark using the Book Reader page
    Then I choose to remove a bookmark using the Book Reader page

