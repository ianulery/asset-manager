Feature: Device age report
  As an administrator
  I want to be able to generate a device age report
  In order to know which devices are due for replacement

  Background:
    Given there are several devices
    And I am signed in

  Scenario: Multiple device ages
    When I view the reports page
    And I view the device aging report
    Then the device aging report should include the devices
    And the report should include the device ages
