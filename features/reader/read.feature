Feature: Reading a book from My Library and Reading tabs
  As a book is read the Reading count increments and once marked as 'read later' its moved out of the Reading section

  Background:
    Given the My Library screen is displayed
    And I capture the current number of books in Reading

  Scenario: A book can be marked as Read and Read Later
    Given I choose to read the first book
    When I navigate back until I get to the My Library page
    Then number of books I am reading should equal 1
    And I go to the Reading page
    When I choose to read the first book
    Then I go back to the User Library Reading Page
    And I choose "Read later" from the Options menu
    Then number of books I am reading should equal 0
    And I should see the Empty Reading Page
