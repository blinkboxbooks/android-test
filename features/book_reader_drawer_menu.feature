Feature: Book Reader drawer menu
  As a reader I am able to navigate the application using the Book Reader drawer menu

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page

  Scenario: I am able to remove a bookmark by using delete option in the Book Reader - My bookmarks page
    Given I choose to add a bookmark using the Book Reader page
    And I visit the "My bookmarks" page from the Bookmark Reader drawer menu
    Then My bookmarks page should have a bookmark
    When I delete the first bookmark
    Then The Empty Bookmarks page should be seen
    And the Book Reader page should not have a bookmark

  #Scenario: I am able to change the visual appearance of the Reader (Reading settings)

  #Scenario: I am able to change the visual appearance of the Reader (Reading settings)

  #Scenario: I am able to view the books' Table of contents (Table of contents)

  #Scenario: I am able to view the details 'About this book' (About this book)

  #Scenario: I am able to Bookmark the current page (Bookmark this page)

  #Scenario: I am able to Remove the currently bookmarked page (Remove bookmark)

  #Scenario: I am able to view my bookmarks (My bookmarks)

  #Scenario: I am able to navigate to the shop (Go to the shop)

  #Scenario: I am able to get help using the reader (Help)