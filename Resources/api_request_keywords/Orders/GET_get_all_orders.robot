*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***

the required Get All Orders Body Parameters has been filled out with valid values
    &{QUERY_PARAMS}=  Create Dictionary
    ...  status=${status_value}
    ...  symbols=${get-all-orders_symbol_value}
    ...  side=${get-all-orders_side_value}
    # ...  limit=
    # ...  after=
    # ...  until=
    # ...  direction=
    # ...  nested=
    Set Test Variable    ${QUERY_PARAMS}

the user send a GET Request for Get All Orders API
    Create Session    ORDERS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    GET On Session  ORDERS  /orders  params=&{QUERY_PARAMS}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Expected Get All Orders API Response Schema

Expected Get All Orders API Response Schema
    @{expected_schema}=    Load Json From File    Resources/json_schema/get_all_orders_schema.json
    Set Test Variable    @{expected_schema}
