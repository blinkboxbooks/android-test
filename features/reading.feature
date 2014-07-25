Feature: Allow the user to use the library to view free and purchased books

	Background:
		Given the anonymous library screen is displayed
		When I sign in
		Then I should be on the user library screen
	@smoke
	Scenario: I am able to open a book and flip through
		Given I open the first book
		Then I can flip pages forward
		And I can flip pages backward
		Then I go back
		Then I should be back on the user library screen
	@smoke
	@wip
	Scenario Outline: Add and remove bookmarks
		Given I open the first book
		And move <fpages> foward
		And I verify that the page is not bookmarked
		When I open the reading option
		And I add a bookmark to the page
		And I verify that the page is bookmarked
		When I open the reading option
		And I remove the bookmark from the page
		And I verify that the page is not bookmarked
		And move <bpages> backward
		Then I go back
		Then I should be back on the user library screen
		Examples:
			| fpages | bpages|
			|   1    |  -1 	 |
