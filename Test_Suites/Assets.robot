*** Settings ***
Resource    ../Resources/import_settings.robot
Resource    ../Resources/api_request_keywords/Assets/GET_get_asset_by_symbol.robot


*** Test Cases ***
Alpaca: Get Assets by Symbol
    Given the Authorization header has been filled out with valid credentials
    When the user send a GET Request for Get Asset AP Symbol API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}