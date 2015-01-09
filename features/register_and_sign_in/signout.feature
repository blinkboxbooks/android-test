@production @qa @ALA-1869
Feature: Sign out from blinkbox books

  Background: Deregister devices for an existing user
    Given a valid user account ready for use on a new device

  Scenario: Existing user successfully signs out
    Given I am signed in as an existing user
    When I use drawer menu to sign out
    Then the sign in page should be displayed

  @new_data @smoke
  Scenario: New user successfully signs out
    Given the My Library screen is displayed
    When I have registered and signed in as new user
    Then the my library page should be displayed
    When I use drawer menu to sign out
    Then the sign in page should be displayed

