Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    And the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed

  @smoke @signed_in
  Scenario: User navigates to the Shop from Library
    Given I touch the shop icon
    Then the Shop page should be displayed

  @smoke @production
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed

  @smoke
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

  @smoke
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

  @smoke @reinstall
  Scenario: Verify refresh icon is present when user not signed in
    When I Sign out
    And I go back to the Anonymous Library page
    Then I should see refresh icon

  @smoke @reinstall
  Scenario: Verify refresh icon is present when user signed in
    Given I am on the User Library page
    Then I should see refresh image

  @smoke @reinstall
  Scenario: Verify embedded book option menu
    When I Sign out
    And I go back to the Anonymous Library page
    And I click on first embedded book options
    Then I should see the following
      | Options                        |
      | Buy the full book              |
      | About this book                |
      | See table of contents          |
      | Read sample                    |
      | Mark sample as 'Finished'      |
      | Remove sample from your device |
