Feature: Test de API súper simple

  Background:
    * configure ssl = true

  Scenario: Verificar que un endpoint público responde 200
    Given url urlGetCharacters
    When method get
    Then status 200
