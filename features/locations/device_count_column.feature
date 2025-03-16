Feature: Device count in locations column
  As an administrator
  I want to be able to quickly see how many devices are located at a location
  In order to determine if a location should be deleted

  Background:
    Given there is a location
    And I am signed in

  Scenario: Location has no devices
    When I view the locations page
    Then the location should show 0 in the device count column

  Scenario: Location has devices
    Given the location has 3 devices
    When I view the locations page
    Then the location should show 3 in the device count column
