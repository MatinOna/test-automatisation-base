@SEGCD-001
Feature: Character complete CRUD

  Background:
    * configure ssl = true

  @id:1
  Scenario: Check the acquisition of the characters
    Given url urlBase
    When method get
    Then status 200

  @id:2
  Scenario: Check the acquisition of the characters for ID
    * def urlGetCharacterById = karate.get('urlBaseId')(1)
    Given url urlGetCharacterById
    When method get
    Then status 200
    And match response.name == "Iron Man"
    And match response.alterego == "Tony Stark"

  @id:3
  Scenario: Check the acquisition of the characters for ID not found
    * def urlGetCharacterById = karate.get('urlBaseId')(1000)
    Given url urlGetCharacterById
    When method get
    Then status 404

  @id:4
  Scenario Outline: Create new character with different names
    Given url urlBase
    And request { name: '<nombre>', alterego: 'Tony Stark', description: 'Genius billionaire', powers: ['Armor', 'Flight'] }
    When method post
    Then status 201

    Examples:
      | nombre       |
      | put-new-name-007d104|

  @id:5
  Scenario: Create a repeat character
    Given url urlBase
    And def entrada = read('classpath:../data/createCharacter.json')
    And request entrada
    When method post
    Then status 400

  @id:6
  Scenario: Create a empty character
    Given url urlBase
    And def entrada = read('classpath:../data/emptyCharacter.json')
    And request entrada
    When method post
    Then status 400
    And match response.name == "Name is required"

  @id:7
  Scenario: Update character
    * def characterId = 1
    * def urlUpdateCharacter = karate.get('urlBaseId')(characterId)
    Given url urlUpdateCharacter
    And def entrada = read('classpath:../data/updatedCharacter.json')
    And request entrada
    When method put
    Then status 200
    And match response.name == 'Iron Man'
    And match response.alterego == 'Tony Stark'
    And match response.description == 'Updated description'
    And match response.powers contains 'Armor'
    And match response.powers contains 'Flight'

  @id:8
  Scenario: Update character not found
    * def characterId = 10000
    * def urlUpdateCharacter = karate.get('urlBaseId')(characterId)
    Given url urlUpdateCharacter
    And def entrada = read('classpath:../data/updatedCharacter.json')
    And request entrada
    When method put
    Then status 404
    And match response.error == 'Character not found'

  @id:3 @ignore
  Scenario: Delete a character by ID
    Given url urlDeleteCharacterById
    When method delete
    Then status 200

  @id:5 @ignore
  Scenario: Error al crear personaje con nombre duplicado
    Given url urlCreateCharacter
    And def entrada = read('classpath:../data/createCharacter.json')
    When method post
    Then status 400
