Feature: Allow the user to use the library to view free and purchased books

	Background:
		Given the anonymous library screen is displayed
		When I sign in
		Then I should be on the user library screen

	Scenario: I am able to open a book and flip through
		Given I open the first book
		Then I can flip pages forward
		And I can flip pages backward
		Then I go back
		Then I should be back on the user library screen
