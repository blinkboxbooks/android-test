Feature: Shop Navigation
  Browse through the shop using the sliding tabs on the Shop page

  Background:
    #Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the my library page
    When I touch the shop icon

  Scenario Outline: Navigating through the shop categories
    Given I touch the <tab> category
    Then I should be taken to the <tab> page
    And There is at least one book present

  Examples:
    | tab                 |
    | Fiction top 100     |
    | Non-fiction top 100 |
    | New releases        |


  Scenario Outline: Verify that you're taken to the correct Categories page and the books return the expected details
    Given I navigate to the "Categories" section
    When I choose to goto the <category> category
    Then That <category> page loads
    And There is at least one book present

  Examples:
    | category          |
    | Romance           |
    | Art & Photography |
    | Food & Drink      |
    | Travel & Holiday  |

  Scenario: Verify that all the books in the free ebooks section are FREE!
    Given I navigate to the "Free ebooks" section
    Then There is at least one book present
    And all the prices should be FREE

  #TODO:featured tab specific test....pan up until you see... Fiction top 100, verify query for bookcover/title/author/price returns true
  #TODO:featured tab specific test....pan up until you see... Non-fiction top 100, verify query for bookcover/title/author/price returns true
  #TODO:featured tab specific test....pan up until you see... Hot New Releases top 100, verify query for bookcover/title/author/price returns true




