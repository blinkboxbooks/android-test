@new_data @qa @dev
Feature: Existing user purchase book from blinkbox books app shop
  As an existing user of blinkbox books
  I want to be able to sign in and purchase a book

  Background:
    Given I am an existing user with saved card

  Scenario: Existing user chooses to purchase a free book and signs in during the purchase
    Given I navigate to shop
    And I navigate to the "Free ebooks" section
    When I choose to purchase a free book
    And I sign in with an existing account
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Scenario: Existing user purchases a book with saved payment card and signs in during the purchase
    Given I navigate to shop
    And I navigate to the "New releases" section
    When I choose to purchase a paid book
    And I sign in with an existing account
    And I use my default card
    And I complete the purchase
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Scenario: Existing user signs in and purchases free book
    Given I sign in as an existing user with a saved payment card
    And I navigate to shop
    And I navigate to the "Free ebooks" section
    When I choose to purchase a free book
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Scenario: Existing user signs in and purchases a book with saved payment card
    Given I sign in as an existing user with a saved payment card
    And I navigate to shop
    And I navigate to the "Fiction top 100" section
    When I choose to purchase a paid book
    And I use my default card
    And I complete the purchase
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Scenario Outline: Existing user purchases a book with a new payment card and saves card details
    Given I sign in as an existing user with a saved payment card
    And I navigate to shop
    And I navigate to the "Non-fiction top 100" section
    When I choose to purchase a paid book
    And the add new card pop up is displayed
    And I pay with a new <card_type> card and choose to save card details
    And I complete the purchase
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Examples: card types
  | card_type  |
  | Mastercard |
  | VISA Debit |

  Scenario Outline: Existing user purchases a book with one off new payment card and signs in during the purchase
    Given I navigate to shop
    And I navigate to the "New releases" section
    When I choose to purchase a paid book
    And I sign in with an existing account
    And the add new card pop up is displayed
    And I pay with a new <card_type> card and choose not to save card details
    And I complete the purchase
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  Examples: card types
  | card_type  |
  | Mastercard |
  | VISA       |

  #Scenario: Existing user tries to purchases a book, for which he already has sample in the library
   # Separate feature file for adding sample required to complete this scenario



