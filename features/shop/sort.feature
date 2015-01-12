Feature: Shop Sorting
  Sorting order in the shop is correct

  Background:
    Given the My Library screen is displayed
    When I touch the shop icon

  Scenario Outline: Sort Order within the various sections in the Shop
    Given I navigate to the "<section>" section
    When I sort books by "<order>" order
    Then the book titles should be sorted by <expectation>

  @smoke-all
  Examples:
    | section      | order               | expectation                 |
    | New releases | Price: (High - Low) | Price: (High - Low)         |

  Examples:
    | section      | order               | expectation                 |
    | New releases | Price: (High - Low) | Price: (High - Low)         |
    | New releases | Price: (Low - High) | Sort by Price: (Low - High) |
    | Free ebooks  | Title: A - Z        | Title A - Z                 |
    | New releases | Title: Z - A        | Title Z - A                 |