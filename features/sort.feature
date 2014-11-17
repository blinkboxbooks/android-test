Feature: Shop Sorting
  Sorting order in the shop is correct

  Background:
    #Given a valid user account ready for use on a new device
    #And I am signed in
    #And I am on the my library page
    Given the my library screen is displayed
    When I touch the shop icon

  Scenario: Sort by Title: A - Z
    Given I navigate to the "Free ebooks" section
    When I sort books by "Title: A - Z" order
    Then the book titles should be sorted by Title A - Z

  Scenario: Sort by Title: Z - A
    Given I navigate to the "New releases" section
    When I sort books by "Title: Z - A" order
    Then the book titles should be sorted by Title Z - A

  Scenario: Sort by Price: (Low - High)
    Given I navigate to the "New releases" section
    When I sort books by "Price: (Low - High)" order
    Then the book titles should be sorted by Sort by Price: (Low - High)

  Scenario: Price: (High - Low)
    Given I navigate to the "New releases" section
    When I sort books by "Price: (High - Low)" order
    Then the book titles should be sorted by Price: (High - Low)

