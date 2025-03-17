Feature: Inventory report
  As an administrator
  I want to be able to generate an inventory report
  In order to know what devices are at each location

  Background:
    Given there are several locations
    And each location has several devices
    And I am signed in

  Scenario: Multiple locations and devices
    When I view the inventory report
    Then the report should include the locations
    And the report should include the devices
