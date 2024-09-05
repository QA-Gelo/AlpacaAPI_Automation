*** Settings ***
Resource    ../Resources/import_settings.robot


*** Test Cases ***
Alpaca: Get Account
    Given the Authorization header has been filled out with valid credentials
    When the user send a GET Request on Get Account API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}