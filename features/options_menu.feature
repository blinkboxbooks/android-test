Feature: My Library Options Menu

  Background:
    Given the My Library screen is displayed

  @runme
  Scenario: I can remove a book from My library
    Given I capture the current number of books in My Library
    When I choose to Remove a book from my Library
    Then the number of books in My Library should decrease by one

  Scenario: I can view the Table of contents of a book from My library
    Given I capture the current Books' details via the About option
    When I choose "Contents" from the Options menu
    Then I should see the correct Contents shown

  #TODO: The options menu has numerous contexts..anonymous user, signed-in user, reading page specific, my library page specific
