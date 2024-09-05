*** Settings ***
Resource    ../../../Resources/import_settings.robot


*** Keywords ***

the user successfully created an order
    the Authorization header has been filled out with valid credentials
    the required Create an Order Body Parameters has been filled out with valid values
    the user send a POST Request for Create an Order API

the required Create an Order Body Parameters has been filled out with valid values
    &{BODY_PARAMS}=  Create Dictionary
    ...  symbol=${symbol_value}
    ...  qty=${qty_value}
    ...  side=${side_value}
    ...  type=${type_value}
    ...  time_in_force=${time_in_force_value}
    # ...  notional=
    # ...  limit_price=
    # ...  stop_price=
    # ...  trail_price=
    # ...  trail_percent=
    # ...  extended_hours=
    # ...  client_order_id=
    # ...  order_class=
    # ...  take_profit=
    # ...  position_intent=
    Set Test Variable    ${BODY_PARAMS}

the user send a POST Request for Create an Order API
    Create Session    ORDERS    ${BaseURL}  headers=&{HEADERS}  verify=true
    ${response}=    POST On Session  ORDERS  /orders  json=&{BODY_PARAMS}  expected_status=any
    Set Test Variable    ${response_json}    ${response.json()}
    Log    ${response_json}
    Log To Console    ${response_json}
    Set Suite Variable    ${order_ID}    ${response_json}[id]
    Log To Console    Order ID: ${order_ID}
    Expected Create an Order API Response Schema

Expected Create an Order API Response Schema
    ${expected_schema}=    Load Json From File    Resources/json_schema/create_an_order_schema.json
    Set Test Variable    ${expected_schema}