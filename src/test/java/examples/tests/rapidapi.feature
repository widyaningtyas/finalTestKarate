Feature: rapid API Test

  Background:
    * url "https://tasty.p.rapidapi.com/"
    * def xRapidapiHost = 'tasty.p.rapidapi.com'
    * def xRapidapiKey = 'ee4040eba9mshd9033f2f5c40952p1345ccjsna5f8ea3610c3'

  Scenario: Get List
    Given path 'recipes/list'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param from = 0
    And param size = 20
    And param tags = 'under_30_minutes'
    When method get
    Then status 200
    And match response.count == 8138
    And match response.results != ''
    And print response

  Scenario: Success Get List Similarities
    Given path 'recipes/list-similarities'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param recipe_id = 8138
    When method get
    Then status 200
    And print response

  Scenario: Invalid Get List Similarities when recipe_id is empty
    Given path 'recipes/list-similarities'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param recipe_id = ''
    When method get
    Then status 200
    And match response.message == 'Bad Request'
    And print response.errors[0].recipe_id[0] == 'Not a valid integer'

  Scenario: Get More Info
    Given path 'recipes/get-more-info'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param id = 8138
    When method get
    Then status 200
    And print response

  Scenario: Get Tips List
    Given path 'tips/list'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param from = 0
    And param size = 30
    And param id = 3562
    When method get
    Then status 200
    And print response

  Scenario: Get Tag List
    Given path 'tags/list'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    When method get
    Then status 200
    And print response

  Scenario: Get Feeds List
    Given path 'feeds/list'
    And header Content-Type = 'application/json'
    And header x-rapidapi-host = xRapidapiHost
    And header x-rapidapi-key = xRapidapiKey
    And param timezone = '%2B0700'
    And param size = 5
    And param vegetarian = false
    And param from = 0
    When method get
    Then status 200
    And print response



