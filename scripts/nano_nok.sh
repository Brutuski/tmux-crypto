#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/NANO-NOK/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "NANO: %.2fkr\n" "$price"
    else
        echo "NANO: --NOK"
    fi
}

get_price

