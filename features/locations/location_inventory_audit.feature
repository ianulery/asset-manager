Feature: Location Inventory Audit
  As an administrator
  I want to send inventory emails to all location managers
  So they can verify they have the needed equipment

  Background:
    Given no emails have been sent
    And there are multiple locations with managers
    And I am signed in

  Scenario: Send audit email
    When I view the locations page
    And I click the send inventory emails button
    Then the location managers should receive inventory emails
    And the page should show that the emails were sent
