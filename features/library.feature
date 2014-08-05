Feature: Navigating the user library screen
<<<<<<< Updated upstream
=======

	Background:
		Given the anonymous library screen is displayed
		When I sign in
        Then the User Library page should be displayed
>>>>>>> Stashed changes

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen

<<<<<<< Updated upstream

  @smoke
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then I should see the shop page
=======
	@smoke
	Scenario: I am able to validate the shop link
		Given I touch the shop icon
		Then I should see the shop page

    Scenario: Verify drawer menu links present when user signed in
        When I open the drawer menu
        Then I should see the following links

          | links                      |
          | On your device             |
          | In your cloud              |
          | Refresh your library       |
          | Sign out                   |
          | Shop for more books        |
          | Frequently asked questions |
          | Contact us                 |
          | Info                       |

>>>>>>> Stashed changes
