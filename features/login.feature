Feature: Log into blinkbox books

    Background:
        Given the anonymous library screen is displayed

	Scenario: I want to sign in
		When I sign in
		Then I should be on the user library screen


    Scenario: I want to sign out
        Given I am an existing user
        When I use drawer menu to sign out
        Then I should be on sign in screen
        When I go back
        Then I should see sign in option in drawer menu

