Feature: Customers personal dashboard scenario

  Background:
    Given I am on magento customer page

  Scenario: Subscribe and Unsubscribe with a registered user
    Given I follow login link in account section
    When I login with username "admin@mailinator.com" and password "adminadmin"
    Then I should be on "My Dashboard" page
    When I edit newsletter section on My Dashboard page
    And I select General Subscription option
    And I click the save button
    Then I should see success message for "subscription_saved" on dashboard page
    When I edit newsletter section on My Dashboard page
    And I de-select General Subscription option
    And I click the save button
    Then I should see success message for "subscription_removed" on dashboard page

  Scenario: Subscribe to newsletter as a guest user
    Given I enter a fresh email id in newsletter subscriprion box
    When I click the subscribe button
    Then I should see success message for "newsletter_subscription_saved" on page
    When I enter a registered email id in newsletter subscriprion box
    And I click the subscribe button
    Then I should see error message for "newsletter_subscription_error" on page

