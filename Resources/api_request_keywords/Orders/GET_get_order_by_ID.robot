*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***

the user send a GET Request for Get Order by Newly Created ID API
    Create Session    ORDERS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    GET On Session  ORDERS  /orders/${order_ID}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Get Order by ID API Response Schema

the user send a GET Request for Get Order by Existing ID API
    Create Session    ORDERS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    GET On Session  ORDERS  /orders/${existing_order_ID}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Get Order by ID API Response Schema

Expected Get Order by ID API Response Schema
    ${expected_schema}=    Load Json From File    Resources/json_schema/create_an_order_schema.json
    Set Test Variable    ${expected_schema}