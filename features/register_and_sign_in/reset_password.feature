Feature: Reset password
  As a blinkbox books app user
  I want to reset my forgotten password
  So that I can sign into blinkbox books again

  Background:
    Given the My Library screen is displayed
    And I navigate to the Sign in page

  Scenario: Forgotten password link
    When I tap on Forgotten your password link
    Then reset password popup is displayed

  Scenario: Reset password with valid email address
    Given I invoke the reset password popup
    When I enter an email address registered with blinkbox books
    And I tap on Send reset link button
    Then I can see password reset email sent confirmation popup

  Scenario: Reset password with valid email address but not registered with blinkbox books
    Given I invoke the reset password popup
    When I enter an email address not registered with blinkbox books
    And I tap on Send reset link button
    Then I can see password reset email sent confirmation popup

  Scenario:  Reset password leaving email address blank
    Given I invoke the reset password popup
    When I tap on Send reset link button without entering email address
    Then I should see the enter a valid email address message

  Scenario Outline: Reset password with invalid email address
    Given I invoke the reset password popup
    When I enter <invalid_email> email address
    And I tap on Send reset link button
    Then I should see the enter a valid email address message

  Examples:
    | invalid_email        |
    | no_thanks@to_you     |
    | 2233@blah            |
    | testblinknow         |
    | %ok*fine@gmail.com   |



