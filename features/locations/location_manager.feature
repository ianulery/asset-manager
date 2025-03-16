Feature: Location Managers
  As an administrator
  I want to be able to set managers for particular locations
  So that they can double check all inventory at their location

  Background:
    Given there is a location
    And I am signed in

  Scenario: No manager assigned
    When I view the location
    Then I should see that no location managers are assigned
    And the location index page should show no assigned managers

  Scenario: Administrator assigns a manager
    Given there is a person
    When I edit the location
    And assign the person as a manager of the location
    Then the person should appear as an assigned manager
    And the person should appear as an assigned manager on the locations index page

  Scenario: Administrator assigns several managers
    Given there are multiple people
    When I edit the location
    And assign several people as managers of the location
    Then those people should appear as assigned managers
    And those people should appear as assigned managers on the locations index page

  Scenario: Administrator removes assigned manager
    Given the location has an assigned manager
    When I edit the location
    And remove the person as an assigned manager
    Then I should see that no location managers are assigned
