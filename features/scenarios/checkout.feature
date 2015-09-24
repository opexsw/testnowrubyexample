#Name: checkout.feature
#Copyright 2015, Opex Software
#Apache License, Version 2.0
#This is a cucumber feature file containing scenarios in GWT format

Feature: Add product to cart and checkout using different payment methods

  Background:
    Given I am on magento customer page

  Scenario: Add product to cart and checkout as a GUEST with payment method CREDIT CARD
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    When I select checkout method as Guest
    And I fill all mandatory details in Billing Information as guest
    And I continue with shipping method
    And I select payment method as "credit_card"
    And I place the order
    Then I should see order confirmation message

  Scenario: Add product to cart and checkout as a GUEST with payment method CASH ON DELIVERY
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    When I select checkout method as Guest
    And I fill all mandatory details in Billing Information as guest
    And I continue with shipping method
    And I select payment method as "cash_on_delivery"
    And I place the order
    Then I should see order confirmation message

  Scenario: Add product to cart and checkout as a GUEST with payment method CHEQUE
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    When I select checkout method as Guest
    And I fill all mandatory details in Billing Information as guest
    And I continue with shipping method
    And I select payment method as "check"
    And I place the order
    Then I should see order confirmation message

  Scenario: Add product to cart and checkout as REGISTERED USER with payment method CREDIT CARD
    Given I follow register link in account section
    And I register a new user
    And I click the register button
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    And I fill all mandatory details in Billing Information as member
    And I continue with shipping method
    And I select payment method as "credit_card"
    And I place the order
    Then I should see order confirmation message

  Scenario: Add product to cart and checkout as REGISTERED USER with payment method CASH ON DELIVERY
    Given I follow register link in account section
    And I register a new user
    And I click the register button
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    And I fill all mandatory details in Billing Information as member
    And I continue with shipping method
    And I select payment method as "cash_on_delivery"
    And I place the order
    Then I should see order confirmation message

  Scenario: Add product to cart and checkout as REGISTERED USER with payment method CHEQUE
    Given I follow register link in account section
    And I register a new user
    And I click the register button
    When I do a global search using "Samsung" keyword
    Then I should see products
    When I add to cart the product based on RUN_INDEX
    Then I proceed to checkout
    And I fill all mandatory details in Billing Information as member
    And I continue with shipping method
    And I select payment method as "check"
    And I place the order
    Then I should see order confirmation message