Feature: Navigating the user library screen

  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then the user Library should be displayed

  @smoke
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed

  Scenario: Verify drawer menu links present when user signed in
    When I open the drawer menu
    Then I should see the following links
      | "On your device"              |
      | "In your cloud"               |
      | "Refresh your library"        |
      | "Sign out"                    |
      | "Shop for more books"         |
      | "Frequently asked questions"  |
      | "Contact us"                  |
      | "Info"                        |

  Scenario: Verify drawer menu links when user signed out
    When I Sign out
    And I go back to the Anonymous Library page
    And I open the menu drawer
    Then I should see the these links
      | "Sign In"                     |
      | "Shop for more books"         |
      | "Frequently asked questions"  |
      | "Contact us"                  |
      | "Info"                        |
