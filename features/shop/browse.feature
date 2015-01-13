Feature: Shop Navigation
  Browse through the shop using the sliding tabs on the Shop page

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the My Library page
    When I touch the shop icon

  Scenario: Verify user go to author page when clicking on link on book details pop up
    Given I navigate to the "Non-fiction top 100" section
    And I capture author name on book description screen
    When I click on author title link
    Then I see correct author name on the screen

  Scenario: Verify user go to author page by swiping
    Given I navigate to the "Non-fiction top 100" section
    And I capture author name on book description screen
    When I swipe to go to author screen
    Then I see correct author name on the screen

  Scenario: Verify sample reader screen is shown after clicking on 'have a look inside' link from book description screen
    Given I navigate to the "Non-fiction top 100" section
    And I capture book details via book description screen
    When I click on have a look inside link
    Then I see correct book details on reader screen

  Scenario: Verify search result page is displayed when viewing more books from author's screen
    Given I navigate to the "Non-fiction top 100" section
    And I click on author link on book description screen
    When I click on see other books written by author
    Then search result page is displayed
    And search result heading matches author name

  Scenario Outline: Navigating through the shop categories
    Given I touch the <tab> category
    Then I should be taken to the <tab> page
    And there is at least one book present

  @sanity-all
  Examples:
    | tab                 |
    | New releases        |

  Examples:
    | tab                 |
    | Fiction top 100     |
    | Non-fiction top 100 |
    | New releases        |

  Scenario Outline: Verify that you're taken to the correct Categories page and the books return the expected details
    Given I navigate to the "Categories" section
    When I choose to go to the <category> category
    Then The <category> page loads
    And there is at least one book present

  @sanity-all
  Examples:
    | category          |
    | Art & Photography |

  Examples:
    | category          |
    | Romance           |
    | Art & Photography |
    | Food & Drink      |
    | Travel & Holiday  |

  @production @dev @ALA-1913
  Scenario: Verify that all the books in the free ebooks section are FREE!
    Given I navigate to the "Free ebooks" section
    Then there is at least one book present
    And all the prices should be FREE

  @production @ALA-1869 @ALA-1870
  Scenario Outline: Verify that there is at least one book present beneath each of the sections in the 'Featured' area
    Given I navigate to the "Featured" section
    Then I can verify that the <featured_section> section has at least one book

  Examples:
    | featured_section          |
    | Fiction top 100           |
    | Non-fiction top 100       |
  # | Romance Books of the Year |
  # This is constantly changing and causes failures unnecessarily..need to work with content team to get a solution

  @ALA-1870 @production
  Scenario: Verify that there is a Highlights section in the Shop > Featured area
    Given I navigate to the "Featured" section
    Then I can verify that the there is a Highlights area
