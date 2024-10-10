Feature: Recipe Request

  Background:
    * url "https://api.spoonacular.com/"
    * def apiKey = 'e22c53945a604e34bf8799ec22a9f620'
    * def hash = 'b8e7f1d65ab85813a10055503785d834a3a24521'

  Scenario: Get Random Recipes
    Given path 'recipes/random'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = true
    And param include-tags = 'dessert'
    And param exclude-tags = 'Milk'
    And param number = 1
    When method get
    Then status 200
    And print response

  Scenario: Get Ingredients by ID
    #Get random recipe first to get the id
    Given path 'recipes/random'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param number = 1
    When method get
    Then status 200
    And print response
    * def recipeId = response.recipes[0].id

    #get the ingredients from the recipe
    Given path 'recipes', recipeId, 'ingredientWidget.json'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print response

  Scenario: Analyze Recipe
    * def reqBody = {"title":"Spaghetti Carbonara","servings":2,"ingredients":["1 lb spaghetti","3.5 oz pancetta","2 Tbsps olive oil","1  egg","0.5 cup parmesan cheese"],"instructions":"Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "}
    Given path 'recipes/analyze'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param language = "en"
    And param includeNutrition = true
    And param includeTaste = true
    And request reqBody
    When method post
    Then status 200
    And print response

  Scenario: Guess Nutrition by Dish Name
    Given path 'recipes/guessNutrition'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param title = 'Ratatouille'
    When method get
    Then status 200
    And print response

  Scenario: Classify Cuisine
    Given path 'recipes/cuisine'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param title = 'Slow-Roasted Crispy Pork Belly'
    And param ingredientList = 'Pork belly\nFennel powder\nOil\nSalt'
    And param language = 'en'
    When method post
    Then status 200
    And print response