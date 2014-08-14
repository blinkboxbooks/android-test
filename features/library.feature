Feature: Navigating the user library screen

  @smoke @signed_in
  Scenario: User navigates to the Shop from Library
    Given the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed
    Given I touch the shop icon
    Then the Shop page should be displayed

  @smoke
  Scenario: I am able to validate the shop link
    Given I touch the shop icon
    Then the shop should be displayed

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

