Feature: Person Inventory Audit
  As an administrator
  I want to send inventory emails to all people
  So they can review the equipment assigned to them

  Background:
    Given no emails have been sent
    And there are people
    And I am signed in

  Scenario: Send audit email
    When I view the people page
    And I click the send inventory emails button
    Then all people should receive inventory emails
    And the page should show that the emails were sent
