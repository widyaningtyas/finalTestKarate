Feature: Test Ingredients
  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '168d166ec30c4ba7a862783bf66382ec'
    * def hash = '1e074b8a4cadc10c60bc4d6ba0ee84e0c98e8a9b'

  Scenario: Get Ingredient Information
    Given path 'food/ingredients/9226/information'
    And param hash = hash
    And param apiKey = apiKey
    And param locale = 'en_US'
    And method get
    And status 200
    Then print response

  Scenario: Search Ingredient
    Given path 'food/ingredients/search'
    And param hash = hash
    And param apiKey = apiKey
    And param query = 'banana'
    And method get
    And status 200
    Then print response

  Scenario: Convert Amount
    Given path 'recipes/convert'
    And param hash = hash
    And param apiKey = apiKey
    And param ingredientName = 'flour'
    And param sourceUnit = 'cups'
    And param targetUnit = 'grams'
    And param sourceAmount = 2.5
    And method get
    And status 200
    Then print response

  Scenario: Compute Ingredient Amount
    Given path 'food/ingredients/9226/amount'
    And param hash = hash
    And param apiKey = apiKey
    And param id = 9226
    And param nutrient = 'protein'
    And method get
    And status 200
    Then print response

  Scenario: Get Ingredient Substitutes
    Given path 'food/ingredients/substitutes'
    And param hash = hash
    And param apiKey = apiKey
    And param ingredientName = 'butter'
    And method get
    And status 200
    Then print response









