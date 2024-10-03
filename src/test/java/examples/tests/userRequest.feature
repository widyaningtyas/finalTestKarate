Feature: Pet API Test

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Create User
    * def reqBody = {"id":456,"username":"test","firstName":"testFirst","lastName":"testLast","email":"test@mail.co","password":"string","phone":"12341425","userStatus":0}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get User by Username
    When url "https://petstore.swagger.io/v2/user/test"
    And method get
    Then print response
    And status 200

  Scenario: User Login
    When url "https://petstore.swagger.io/v2/user/login?username=test&password=string"
    And method get
    Then print response
    And status 200

  Scenario: Update User
    * def reqBody = {"id":456,"username":"test","firstName":"testFirstUpdated","lastName":"testLast","email":"test@mail.co","password":"string","phone":"12341425","userStatus":0}
    When url "https://petstore.swagger.io/v2/user/test"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete User
    When url "https://petstore.swagger.io/v2/user/test"
    And method delete
    Then print response
    And status 200

  Scenario: User Logout
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200