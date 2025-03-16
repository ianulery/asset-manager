Feature: Location Inventory Email
  As an administrator
  I want to be able to send location inventory emails to location managers
  In order to reconcile inventory

  Background:
    Given no emails have been sent
    And there is a location
    And I am signed in

  Scenario: The location has managers
    Given the location has location managers
    When I view the locations page
    And I click the "Send Inventory Email" link
    Then the location managers should receive an inventory email
    And the page should show that the email was sent

  Scenario: The location has no managers
    When I view the locations page
    And I view the location details page
    And I click the "Send Inventory Email" link
    Then I should see an alert that the location has no managers 
   