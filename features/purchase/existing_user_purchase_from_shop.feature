Feature: Existing user purchase book from blinkbox books app shop
  As an existing user of blinkbox books
  I want to be able to sign in and purchase a book

  Background:
    Given I am an existing user with saved card
    And I navigate to shop

  Scenario: Existing user chooses to purchase a free book and signs in during the purchase
    When I navigate to the "Free ebooks" section
    And I choose to purchase a free book
    And I sign in with an existing account
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  @new_data
  Scenario: Existing user purchases a book with saved payment card and signs in during the purchase
    When I navigate to the "New releases" section
    And I choose to purchase a paid book
    And I sign in with an existing account
    And I use my default card
    And I complete the purchase
    Then I should see the Your new book is downloading popup
    And I can see the newly purchased book added to My Library

  #Scenario: Existing user signs in and purchases free book

  #Scenario: Existing user purchases a book with saved payment card

  #Scenario: Existing user purchases a book with a new payment card and saves card details

  #Scenario: Existing user purchases a book with one off new payment card and signs in during the purchase

  #Scenario: Existing user tries to purchases a book, for which he already has sample in the library



