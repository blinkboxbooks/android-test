Feature: Navgating the user library screen
	Background:
		Given the anonymous library screen is displayed
		When I sign in
		Then I should be on the user library screen


	@smoke
	Scenario: I am able to validate the shop link
		Given I touch the shop icon
		Then I should see the shop page
