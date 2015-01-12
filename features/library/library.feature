Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    When I sign in
    Then the my library should be displayed

  @production @dev @ALA-1870
  Scenario: User navigates to the Shop from Library
    Given I touch the shop icon
    Then the Shop page should be displayed

  @production @dev @ALA-1870
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed

  @smoke-all
  Scenario: Verify drawer menu links present when user signed in
    When I open the drawer menu
    Then I should see the following links
      | Signed In Drawer Menu Options |
      | Currently reading             |
      | My library                    |
      | Refresh your library          |
      | Sign out                      |
      | Shop for more books           |
      | Frequently asked questions    |
      | Contact us                    |
      | Info                          |

  Scenario: Verify drawer menu links when user signed out
    When I Sign out
    Given I go back to the My Library page
    And I open the drawer menu
    Then I should see the following links
      | Signed Out Drawer Menu Options |
      | Register                       |
      | Sign In                        |
      | Shop for more books            |
      | Frequently asked questions     |
      | Contact us                     |
      | Info                           |