Feature: Log into blinkbox books

  Scenario: I want to sign in
    Given I have a valid user account ready to use on a new device
    And the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen
