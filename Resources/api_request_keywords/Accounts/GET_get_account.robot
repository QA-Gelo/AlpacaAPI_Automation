*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***

the user send a GET Request on Get Account API
    Create Session    ACCOUNTS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    GET On Session  ACCOUNTS  /account  json=&{BodyParams}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Get Account API Response Schema

Expected Get Account API Response Schema
    ${expected_schema}=    Load Json From File    Resources/json_schema/get_account_schema.json
    Set Test Variable    ${expected_schema}