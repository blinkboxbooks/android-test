Feature: End of book screen
  As a reader, I want to explore more books when I reach end of book

  Background:
    Given the My Library screen is displayed
    And I capture the current number of books in My Library
    When I open the first book on the My Library page
    And I go to end of the book

  @production @ALA-1946
  Scenario: After reaching end of the book, you decide to purchase and are prompted with create new account pop up
    When I choose to purchase the book
    And I am prompted to register and proceed
    Then the add new card pop up is displayed

  Scenario: Click on shop for more books and verify goes to shop screen
    When I click on shop for more books button
    Then shop screen is displayed
