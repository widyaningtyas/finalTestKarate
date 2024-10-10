Feature: Get OAuth Token

  Background:
    * def clientID = 'client-id'
    * def clientSecret = 'clientSecret'
    # Endpoint untuk client tembak clientId dan clientSecret
    * def tokenUrl = 'https://server-endpoint.com/ouath/token'

  Scenario: Get OAuth Token Using Client Credentials
    Given url tokenUrl
    And request {grant_type: 'client_credentials', client_id: '#(clientID)', client_secret: '#(clientSecret)'}
    And header Content-Type = 'application/x-www-form-urlencoded'
    When method POST
    Then status 200
    And print response
    * def access_token = response.access_token

    #Store token globally
    karate.callSingle('classpath:store-token.feature', {access_token: access_token})