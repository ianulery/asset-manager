Feature: Manage users
  As an administrator
  I want to be able create, edit, and delete user accounts
  In order to manage access to the IT assset management application

  Background:
    Given I am signed in

  Scenario: Add a new user
    When I go to the users page
    And I add a new user
    Then the new user should appear on the users page

  Scenario: Edit existing user
    Given there is another user
    When I go to the users page
    And I view the other user
    And I change the name of the other user
    Then the new name should appear on the users page

  Scenario: Delete existing user
    Given there is another user
    When I go to the users page
    And I view the other user
    And I delete the other user
    Then the user should not appear on the users page
