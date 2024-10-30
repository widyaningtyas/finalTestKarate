Feature: Open Weather API Test

  Background:
    Given url "https://api.openweathermap.org/"
    * def apiKey = '774063a2abc9af369a8480cff2930760'

  @Positive
  Scenario: Get Current and Forecast Weather Data From Latitude Longitude
    #Get latitude and longitude first from geocoding api
    Given path 'geo/1.0/zip'
    And param zip = 'E14,GB'
    And param appid = apiKey
    When method get
    Then status 200
    And print response
    And match response != ''
    * def lat = response.lat
    * def lon = response.lon

    #get weather forecast
    Given path 'data/2.5/weather'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    And param units = 'imperial'
    When method get
    Then status 200
    And print response
    And match response != ''
    And match response.coord.lon == lon
    And match response.coord.lat == lat
    And match response.sys.country == 'GB'

  @Positive
  Scenario: Get Weather Data From City Name
    Given path 'data/2.5/weather'
    And param q = 'Gothenburg'
    And param appid = apiKey
    When method get
    Then status 200
    And print response
    And match response != ''
    And match response.sys.country == 'SE'

  @Positive
  Scenario: Get Weather Data From City ID
    Given path 'data/2.5/weather'
    And param id = '54225'
    And param appid = apiKey
    When method get
    Then status 200
    And print response
    And match response != ''
    And match response.sys.country == 'SO'

  @Positive
  Scenario: Get Weather Data From ZIP code
    Given path 'data/2.5/weather'
    And param zip = '94040,us'
    And param appid = apiKey
    When method get
    Then status 200
    And print response
    And match response != ''
    And match response.sys.country == 'US'

  @Negative
  Scenario: Get Current and Forecast Weather Data From Wrong Latitude Longitude
    Given path 'data/2.5/weather'
    And param lat = 'wrongLat'
    And param lon = 'wrongLon'
    And param appid = apiKey
    When method get
    Then status 400
    And print response
    And match response.message == 'wrong latitude'

  @Negative
  Scenario: Get Weather Data From Unknown City Name
    Given path 'data/2.5/weather'
    And param q = 'unknown'
    And param appid = apiKey
    When method get
    Then status 404
    And print response
    And match response.message == 'city not found'

  @Negative
  Scenario: Get Weather Data From Incorrect City ID
    Given path 'data/2.5/weather'
    And param id = '999999999'
    And param appid = apiKey
    When method get
    Then status 404
    And print response
    And match response.message == 'city not found'

  @Negative
  Scenario: Get Weather Data From Incorrect ZIP code
    Given path 'data/2.5/weather'
    And param zip = '9999999,us'
    And param appid = apiKey
    When method get
    Then status 404
    And print response
    And match response.message == 'city not found'