@pending
Feature: I am able to exchange some earth pounds with BlinkBox and in exchange I will have an ebook!

  Background:
    Given I am signed in as a user who has a credit card

    Scenario:
      Given I choose to purchase a book from the "Featured" section
      And I use my default card
      When I complete the purchase
      And I choose to go My Library
      Then The I can see the newly purchased book added to My Library
      And I can verify its contents






