Feature: Log into blinkbox books

	Scenario: I want to sign in
		Given the anonymous library screen is displayed
		When I sign in
                And I reset my devices 
                Then I should be on the user library screen
