Feature: Pet API Test

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Place an Order
    * def reqBody = {"id":4435,"petId":1,"quantity":5,"shipDate":"2024-10-03T07:54:12.976Z","status":"placed","complete":true}
    When url "https://petstore.swagger.io/v2/store/order"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get Store Inventory
    When url "https://petstore.swagger.io/v2/store/inventory"
    And method get
    Then print response
    And status 200

  Scenario: Get Order ID
    When url "https://petstore.swagger.io/v2/store/order/4435"
    And method get
    Then print response
    And status 200

  Scenario: Delete Order
    When url "https://petstore.swagger.io/v2/store/order/4435"
    And method delete
    Then print response
    And status 200