Feature: End of the sample book screen
  As a reader, I want to either buy the book or view more books in shop

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And I go to end of the sample book

  Scenario: After reaching end of the sample book, you decide to purchase and are prompted with create new account pop up
    When I choose to purchase full copy book
    And I am prompted to register and proceed
    Then the add new card pop up is displayed

  Scenario: Click on shop for more books and verify goes to shop screen
    When I click on shop for more books button
    Then shop screen is displayed
