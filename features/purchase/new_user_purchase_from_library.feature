@pending @dev
Feature: I am able to exchange some earth pounds with BlinkBox and in exchange I will have an ebook!

  Background:
    Given I sign in as a new user with a credit card

  Scenario: New user purchases full book from sample in library
    When I choose to purchase first book using options button
    And I use my default card
    And I complete the purchase
    And I choose to go My Library
    Then I should not see buy option in Options menu






