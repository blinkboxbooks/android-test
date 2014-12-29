@dev
Feature: Download a sample book and verify it is shown in both device and cloud and labelled 'Sample'

  Background:
    Given I register and sign in as a new user

  Scenario Outline: I download a sample book and verify it is in my device
    Given I touch the shop icon
    And the Shop page should be displayed
    When I choose to get a free sample <book> from the Highlights area
    And I am on the My Library page
    When I click on first embedded book options
    Then I see that the sample <book> is there

  Examples:
  | book    |
  | Respect |



