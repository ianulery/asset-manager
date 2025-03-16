Feature: Discard devices
  As an administrator
  I want to be able to mark a device as discarded
  So that the devices page only shows current devices by default

  Background:
    Given there is a device
    And I am signed in

  Scenario: Device is not discarded
    When I view the devices page
    Then I should see the device

  Scenario: Device is discarded
    When I view the devices page
    And I edit the device
    And I mark the device as discarded
    Then the device should no longer appear on the devices page

  Scenario: Show discarded devices
    Given the device is discarded
    When I view the devices page
    And enable the show discarded devices option
    Then the discarded device should appear
    And the show discarded devices checkbox should be checked
