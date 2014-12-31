Feature: Page slider
  As a Blinkbox books app user
  I want to skim through the pages by using reader slider

  @ALA-1867 @unstable
  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And I set the book slider position to 50

  @ALA-1867 @unstable
  Scenario: Check chapter and percentage match on the reader screen after moving reader slider
    When I capture progress and chapter
    And I am on reader screen
    Then I should see last reading position

  @ALA-1867 @unstable
  Scenario: Check chapter and percentage match on the reader screen after moving reader slider back
    When I set the book slider position back to 20
    And I capture progress and chapter
    And I close the reader slider
    Then I should see last reading position

  @ALA-1867 @unstable
  Scenario: Move reader slider, verify last reading position after closing and opening the book
    When I exit the book
    And I open the book again
    And I have read the book to certain position
    Then I should see last reading position

  @ALA-1867 @unstable
  Scenario: Verify last reading position on reader slider from My bookmarks page
    Given I have bookmarked a page
    And I continue reading turning 4 pages forward
    When I visit the "Your bookmarks & highlights" page from the Reader option menu
    And I tap on bookmark link
    And I save last reading position from my bookmarks page
    And I am on bookmarked page
    Then verify last reading position on reader slider

  @ALA-1867 @unstable
  Scenario: Verify last reading position on reader slider from table of content
    Given I visit the "Table of contents" page from the Reader option menu
    When I select a chapter link
    And I save last reading position from TOC page
    And I am on selected chapter
    Then verify last reading position on reader slider



