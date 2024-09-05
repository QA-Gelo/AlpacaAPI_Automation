*** Variables ***

${BaseURL}                                  https://paper-api.alpaca.markets/v2  
${response_json}
${expected_schema}
# Create an Order Body Parameter Variables
${symbol_value}                             AP
${qty_value}                                3
${notional_value}                           100
${side_value}                               buy
${type_value}                               market
${time_in_force_value}                      day
# Get All Orders Body Parameter Variables
${status_value}                             all
${get-all-orders_symbol_value}              AP
${get-all-orders_side_value}                buy
# Get Order By ID Body Parameter Variables
${order_ID}
${existing_order_ID}                        e8971640-930d-4b87-aae2-351ca4f27d72


