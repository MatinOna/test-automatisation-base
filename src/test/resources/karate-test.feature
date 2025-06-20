@SEGCD-001
Feature: Character CRUD

  Background:
    * configure ssl = true

  @id:1
  Scenario: Check the acquisition of the characters
    Given url urlGetCharacters
    When method get
    Then status 200

  @id:2
  Scenario: Check the acquisition of the characters for ID
    Given url urlGetCharacterById
    When method get
    Then status 200
    And match response.name == "Iron Man"
    And match response.alterego == "Tony Stark"

