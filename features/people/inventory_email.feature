Feature: Send a device inventory email
  In order to keep updated records of devices and assignments
  As an administrator
  I should be able to send device inventory emails

  Background:
    Given no emails have been sent
    And there is a person

  Scenario: Person has no assigned devices
    Given the person has no assigned devices
    When an inventory email is sent
    Then the email should say that no devices are assigned

  Scenario: Person has devices assigned
    Given the person has assigned devices
    When an inventory email is sent
    Then the email should include their assigned devices

  Scenario: Send an inventory email from the people index page
    Given I am signed in
    When I access the people index page
    And I send an equipment inventory email to the person
    Then they should receive an equipment inventory email
    And the page should show that the email was sent

  Scenario: Send an inventory email from the person's detail page
    Given I am signed in
    When I access the people index page
    And I view the person's detail page
    And I send an equipment inventory email to the person
    Then they should receive an equipment inventory email
    And the page should show that the email was sent
