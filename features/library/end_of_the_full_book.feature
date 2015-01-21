Feature: End of the full book screen
  As a reader, I want to either browse for more books in shop

  Background:
    Given I navigate to shop and buy "Free ebooks"
    And I can see the newly purchased book added to My Library
    And I navigate back until I get to the My Library page
    When I open the first book on the My Library page
    And I go to end of the full book

   @qa @dev
    Scenario: Click on any book cover, I am taken to search results
     When I click on book cover that I like to see
     Then goes to search result screen

   @qa @dev
    Scenario: When I choose to view more books, I am taken to the shop page
     When I click on view more books in the shop button
     Then shop screen is displayed
