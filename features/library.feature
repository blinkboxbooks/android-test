Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page

  @smoke @production
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed
