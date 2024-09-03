*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***
the user send a POST Request for Create an Order API
    Create Session    ORDERS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    POST On Session  ORDERS  /orders  json=&{BODY_PARAMS}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Create an Order API Response Schema

Expected Create an Order API Response Schema
    ${expected_schema}=    Load Json From File    Resources/json_schema/create_an_order_schema.json
    Set Test Variable    ${expected_schema}