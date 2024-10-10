Feature: Store Token

  Scenario: Store OAuth Token
    * def accessToken = __arg.accessToken
    * karate.set('bearerToken', accessToken)