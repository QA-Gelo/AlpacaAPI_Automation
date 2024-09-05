*** Settings ***
Resource    ../Resources/import_settings.robot

*** Test Cases ***
Alpaca: Create an Order
    [Tags]    Create_an_Order
    Given the Authorization header has been filled out with valid credentials
    And the required Create an Order Body Parameters has been filled out with valid values
    When the user send a POST Request for Create an Order API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}

Alpaca: Get All Orders
    [Tags]    Get_All_Orders
    Given the Authorization header has been filled out with valid credentials
    And the required Get All Orders Body Parameters has been filled out with valid values
    When the user send a GET Request for Get All Orders API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}

Alpaca: Get Order by Newly Created ID
    [Tags]    Get_Order_by_New_ID
    Given the user successfully created an order
    When the user send a GET Request for Get Order by Newly Created ID API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}

Alpaca: Get Order by Existing ID
    [Tags]    Get_Order_by_Existing_ID
    Given the Authorization header has been filled out with valid credentials
    When the user send a GET Request for Get Order by Existing ID API
    Then the Status Code and Message should be 200 and OK
    And the Response Matches the expected Schema    ${response_json}    ${expected_schema}