Feature: Meal Plan Request

  Background:
    * url "https://api.spoonacular.com/"
    * def apiKey = 'e22c53945a604e34bf8799ec22a9f620'
    * def hash = 'b8e7f1d65ab85813a10055503785d834a3a24521'
    * def username = 'testspooacular'
    * def startDate = '2024-09-25'

  Scenario: Get Meal Plan Week
    Given path 'mealplanner/' + username + '/week/' + startDate
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  Scenario: Get Meal Plan Day
    Given path 'mealplanner/' + username + '/day/' + startDate
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  Scenario: Generate Meal Plan
    * def reqBody = {'timeFrame': 'day', 'targetCalories': 2000, 'diet': 'Ketogenic', 'exclude': 'nut'}
    Given path 'mealplanner/generate'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request reqBody
    When method get
    Then status 200
    And print response

  Scenario: Adding Items to Meal Plan
    * def reqBody = {"date":1589500800,"slot":1,"position":0,"type":"INGREDIENTS","value":{"ingredients":[{"name":"1 banana"}]}}
    Given path 'mealplanner/', username, '/items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request reqBody
    When method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: Adding Items to Shopping List
    * def reqBody = {"item":"1 package baking powder","aisle":"Baking","parse":true}
    Given path 'mealplanner', username, 'shopping-list/items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request reqBody
    When method post
    Then status 200
    And print response

  Scenario: Get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  @test
  Scenario: ML model Image Classification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/6F320FC7-CBD7-419D-B790-24DA25E975F9/Derivates/9774C36E-8478-4BE3-A8CD-FF02AC5B9BCB.jpg'
    When method get
    Then status 200
    And print response