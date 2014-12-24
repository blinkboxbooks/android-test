@manual
Feature: Highlights
  I am able to highlight some text so that I can annotate

  Scenario: I can highlight some text
    Given: I select some text to be highlighted
    Then I can see that its highlighted

  Scenario: I can remove a highlight
    Given: I have some text that is already highlighted
    When I remove the highlight from the text
    Then There is no highlight present on the text

