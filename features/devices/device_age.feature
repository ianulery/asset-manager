Feature: Device age
  As an administrator
  I want to be able to track the age of devices
  In order to know when devices are due for replacement

  Background:
    Given there is a device
    And I am signed in

  Scenario: Device is 0 years old
    When I view the devices page
    And I edit the device
    And I set the device acquisition date to today
    Then the device should show 0 years

  Scenario: Device is 2 years old
    When I view the devices page
    And I edit the device
    And I set the device acquisition date to 2 years ago
    Then the device should show 2 years
