Feature: I want to search and purchase titles from the shop

	Background:
		Given the anonymous library screen is displayed
		When I sign in
		Then I should be on the user library screen
		Given I touch the shop icon
		Then I should see the shop page
	@shop
	Scenario Outline:
		Given I search for <entry>
		Then I should be presented with results
		Examples:
			|entry        |
			|"Bob Marley"   |
			|"Michael Palin"|
