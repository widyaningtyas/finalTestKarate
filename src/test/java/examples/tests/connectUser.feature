Feature: Get user Hash and Uname

  Background:
    * url "https://api.spoonacular.com/"
    * def apiKey = 'e22c53945a604e34bf8799ec22a9f620'

  Scenario: Get username and hash from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "testSpooacular", "firstName":"test", "lastName":"spoonacular", "email":"michelle.michelle@krom.id"}
    When method post
    Then status 200
    And print response