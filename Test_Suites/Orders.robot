*** Settings ***
Resource    ../Resources/import_settings.robot
Resource    ../Resources/api_request_keywords/Orders/POST_create_an_order.robot

*** Test Cases ***
Alpaca: Create an Order
    Given the Authorization header has been filled out with valid credentials
    And the required Body Parameters has been filled out with valid values
    When the user send a POST Request for Create an Order API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}