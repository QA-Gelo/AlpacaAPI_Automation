*** Settings ***
Resource    common.robot
Resource    steps_definition.robot
Resource    ../Resources/api_request_keywords/Accounts/GET_get_account.robot
Resource    ../Resources/api_request_keywords/Assets/GET_get_asset_by_symbol.robot
Resource    ../Resources/api_request_keywords/Orders/POST_create_an_order.robot
Resource    ../Resources/api_request_keywords/Orders/GET_get_all_orders.robot
Resource    ../Resources/api_request_keywords/Orders/GET_get_order_by_ID.robot