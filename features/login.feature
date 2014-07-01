Feature: Log into blinkbox books

	Scenario: I want to sign in
		Given the anonymous library screen is displayed
		When I sign in
		Then I should be on the user library screen
