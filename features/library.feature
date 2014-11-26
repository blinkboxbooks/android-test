Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    When I sign in
    Then the my library should be displayed

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
      | Signed In Drawer Menu Options |
      | Currently reading             |
      | My library                    |
      | Refresh your library          |
      | Sign out                      |
      | Shop for more books           |
      | Frequently asked questions    |
      | Contact us                    |
      | Info                          |

  @smoke
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

  @smoke @reinstall
  Scenario: Verify embedded book option menu
    When I Sign out
    And I go back to the My Library page
    And I click on first embedded book options
    Then I should see the following links
      | Options        |
      | Buy full ebook |
      | About          |
      | Contents       |
      | Read           |
      | Remove         |

  @runme
  Scenario: Verify embedded book option menu as a Signed in user (book not yet downloaded)
    When I click on first embedded book options
    Then I should see the following links
      | Options        |
      | Buy full ebook |
      | Download       |
      | About          |
      | Remove         |