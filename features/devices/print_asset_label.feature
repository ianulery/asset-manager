Feature: Print Asset Label
  As an administrator
  I want to be able to print an asset label
  In order to keep track of assets

  Background:
    Given I am signed in
    And there is a device

  Scenario: Print asset label
    When I view the device
    And I click the print asset label link
    Then I should see a printable asset label
