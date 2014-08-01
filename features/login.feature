Feature: Log into blinkbox books

    Background:
      Given the anonymous library screen is displayed

	Scenario: I want to sign in
		When I sign in
		Then I should be on the user library screen


    Scenario: I want to sign out
      Given I sign in
      Then I should be on the user library screen
      When I sign out
      Then I should be on anonymous library screen

