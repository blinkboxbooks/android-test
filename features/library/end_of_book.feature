Feature: End of book screen
  As a reader, I want to explore more books when I reach end of book

  Background:
    Given the My Library screen is displayed
    And I capture the current number of books in My Library
    When I open the first book on the My Library page
    And I go to end of the book

  Scenario: After reaching end of the book, you decide to purchase and are prompted with create new account pop up
    When I choose to purchase the book
    And I am prompted to register and proceed
    Then how would like to pay pop up is displayed

  Scenario: Click on shop for more books and verify goes to shop screen
    When I click on shop for more books button
    Then shop screen is displayed

  Scenario: Remove sample and verify number of books in my library decreases
    And I remove the book
    Then the number of books in My Library should decrease by one

  Scenario: I am taken back to my library when choosing to do so after reading book
    When I click to go back to library screen
    Then library screen is displayed

  Scenario: When clicking on any book cover, I am taken to search results
    When I click on book that I like to see
    Then goes to search result screen

  Scenario: When I choose to view more books, I am taken to the shop page
    When I click on to view more books
    Then shop screen is displayed