Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    And the My Library screen is displayed

  Scenario Outline:
    When I navigate to <drawer_menu_item> in the user library drawer menu
    Then the <page> should be displayed

  @smoke
  Examples:
    | drawer_menu_item           | page          |
    | Frequently asked questions | FAQ page      |

  Examples:
    | drawer_menu_item           | page          |
    | Register                   | Register page |
    | Sign in                    | Sign in page  |
    | Shop for more books        | Shop page     |
    | Frequently asked questions | FAQ page      |
  # | Contact us                 | ????          |
    | Info                       | Info page     |

  Scenario Outline:
    When I sign in
    And I navigate to <drawer_menu_item> in the user library drawer menu
    Then the <page> should be displayed

  @smoke
  Examples:
    | drawer_menu_item           | page            |
    | Currently reading          | reading page    |

  Examples:
    | drawer_menu_item           | page            |
    | Currently reading          | reading page    |
    | Refresh your library       | my library page |
    | Currently reading          | reading page    |
    | My library                 | my library page |
    | Sign out                   | Sign in page    |
    | Shop for more books        | Shop page       |
    | Frequently asked questions | FAQ page        |
  # | Contact us                 | ????            |
    | Info                       | Info page       |
