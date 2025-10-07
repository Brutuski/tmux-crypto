#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/LTC-AUD/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "LTC: %.2fA$\n" "$price"
    else
        echo "LTC: --AUD"
    fi
}

get_price

