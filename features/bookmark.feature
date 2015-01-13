Feature: Bookmarking
  As a reader I am able to add and remove bookmarks

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And turn 13 pages forward

  Scenario: I am able to add a bookmark by using the 'quick' add button on the Book Reader page
    Given I choose to add a bookmark using the Book Reader page
    When I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    And My bookmarks page should have a bookmark
    Then The bookmarks' details should match the details shown in the Book Reader popup

  Scenario: I am able to remove a bookmark by using the 'quick' add/remove buttons on the Book Reader page
    Given I choose to add a bookmark using the Book Reader page
    And I choose to remove a bookmark using the Book Reader page
    When I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    Then The Empty Bookmarks page should be seen

  Scenario: I am able to add a bookmark by using the drawer menu on the Book Reader page
    Given I choose to add a bookmark using the Book Reader page
    When I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    Then The My bookmarks page should be seen
    And My bookmarks page should have a bookmark
    And The bookmarks' details should match the details shown in the Book Reader popup

  Scenario: I am able to remove a bookmark by using the drawer menu on the Book Reader page
    Given I choose to add a bookmark using the Book Reader page
    When I remove the bookmark using the Book Reader drawer menu
    And the Book Reader page should not have a bookmark
    Then I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    And The Empty Bookmarks page should be seen

  Scenario: I am able to remove a bookmark by using delete option in the Book Reader - My bookmarks page
    Given I choose to add a bookmark using the Book Reader page
    And I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    Then My bookmarks page should have a bookmark
    When I delete the first bookmark
    Then The Empty Bookmarks page should be seen
    And the Book Reader page should not have a bookmark