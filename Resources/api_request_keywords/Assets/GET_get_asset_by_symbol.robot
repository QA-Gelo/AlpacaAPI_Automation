*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***
the user send a GET Request for Get Asset ${asset_symbol} Symbol API
    Create Session    ASSETS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    GET On Session  ASSETS  /assets/${asset_symbol}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Get Asset by Symbol API Response Schema

Expected Get Asset by Symbol API Response Schema
    ${expected_schema}=    Load Json From File    Resources/json_schema/get_asset_by_symbol_schema.json
    Set Test Variable    ${expected_schema}