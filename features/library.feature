Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the User Library page

  @smoke @signed_in
  Scenario: User navigates to the Shop from Library
    Given the anonymous library screen is displayed
    When I sign in
<<<<<<< HEAD
    Then the user Library should be displayed
=======
    Then the user library should be displayed
    Given I touch the shop icon
    Then the Shop page should be displayed
>>>>>>> upstream/master

  @smoke @production
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed

<<<<<<< HEAD
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
=======
  @smoke
  Scenario: Verify embedded book option menu
    Given the anonymous library screen is displayed
    And I click on first embedded book options
    Then I should see the following
      | Options                        |
      | Buy the full book              |
      | About this book                |
      | See table of contents          |
      | Read sample                    |
      | Mark sample as 'Finished'      |
      | Remove sample from your device |

>>>>>>> upstream/master
