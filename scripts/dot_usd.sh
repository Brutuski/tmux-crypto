#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/DOT-USD/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "DOT: %.2f$\n" "$price"
    else
        echo "DOT: --USD"
    fi
}

get_price

