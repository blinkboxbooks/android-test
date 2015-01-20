@pending @ALA-1874
Feature: End of the full book screen
  As a reader, I want to either browse for more books in shop

  Background:
    Given I sign in as a new user with a credit card
    When I choose to purchase first book using options button
    And I use my default card
    And I complete the purchase
    And I choose to go My Library
    Given I download first book
    When I open the first book on the My Library page
    And I go to end of the full book

   @dev @qa
    Scenario: Click on any book cover, I am taken to search results
     When I click on book cover that I like to see
     Then goes to search result screen

    @dev @qa
    Scenario: When I choose to view more books, I am taken to the shop page
     When I click on view more books in the shop button
     Then shop screen is displayed
