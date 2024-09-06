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

the Status Code and Message should be ${status_code} and ${status_message}
    Status Should Be  ${status_code}  msg=${status_message}

the Response Matches The Expected Schema
    [Arguments]    ${response_json}    ${expected_schema}
    ${is_list}=    Evaluate    isinstance(${response_json}, list)
    Run Keyword If    ${is_list}    Validate List of Dictionaries    ${response_json}    ${expected_schema}
    ...    ELSE    Validate Dictionary Keys    ${response_json}    ${expected_schema}

Validate List of Dictionaries
    [Arguments]    ${list}    ${expected_schema}
    Should Be True    ${list}    msg=Response is not a list
    FOR    ${item}    IN    @{list}
        Validate Dictionary Keys    ${item}    ${expected_schema[0]}
    END

Validate Dictionary Keys
    [Arguments]    ${dictionary}    ${expected_schema}
    FOR    ${key}    IN    @{expected_schema.keys()}
        Dictionary Should Contain Key    ${dictionary}    ${key}
    END