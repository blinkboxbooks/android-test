@new_data @production @qa @ALA-1869
Feature: Existing user purchase book from blinkbox books app shop
  As a guest user of blinkbox books
  I want to be able to register and purchase a book

  Scenario: Guest user purchases a free book
    Given I navigate to shop
    And I navigate to the "Free ebooks" section
    When I choose to purchase a free book
    And I am prompted to register and proceed
    Then I should see the Welcome to blinkbox books popup
    And I can see the newly purchased book added to My Library

  Scenario: Guest user purchases a book and saves payment details
    Given I navigate to shop
    And I navigate to the "Fiction top 100" section
    When I choose to purchase a paid book
    And I am prompted to register and proceed
    And the add new card pop up is displayed
    And I pay with a new VISA card
    And I complete the purchase
    Then I should see the Welcome to blinkbox books popup
    And I can see the newly purchased book added to My Library

  Scenario Outline: Guest user purchases a book and saves payment details
    Given I navigate to shop
    And I navigate to the "Non-fiction top 100" section
    When I choose to purchase a paid book
    And I am prompted to register and proceed
    And the add new card pop up is displayed
    And I pay with a new <card_type> card
    And I complete the purchase
    Then I should see the Welcome to blinkbox books popup
    And I can see the newly purchased book added to My Library

  Examples: card types
    | card_type  |
    | Mastercard |
    | VISA Debit |


  #Scenario: Guest user buys a book but does not save payment details