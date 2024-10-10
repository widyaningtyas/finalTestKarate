Feature: Other features that use bearer token

  Background:
    * def token = karate.get('BearerToken')
    * def authHeader = {Authorization: 'Bearer ' + '#(token)'}

  Scenario: Get Bearer Token
    Given url 'https://blabla.com'
    And headers authHeader