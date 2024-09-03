*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     OperatingSystem
Library     String
Library     ../Utilities/CustomLibrary.py
Resource    environment_config/environment_variables.robot
Resource    environment_config/api_keys.robot


*** Keywords ***

the Authorization header has been filled out with valid credentials
    &{HEADERS}=  Create Dictionary
    ...  APCA-API-KEY-ID=${API_KEY}
    ...  APCA-API-SECRET-KEY=${SECRET_KEY}
    Set Test Variable    ${HEADERS}
    
the required Body Parameters has been filled out with valid values
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

the Status Code and Message should be ${status_code} and ${status_message}
    Status Should Be  ${status_code}  msg=${status_message}

the Response Matches the expected Schema
    [Arguments]    ${response_json}    ${expected_schema}    
    FOR    ${key}    IN    @{expected_schema.keys()}
        Dictionary Should Contain Key    ${response_json}    ${key}
    END