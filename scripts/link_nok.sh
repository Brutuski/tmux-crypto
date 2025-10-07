#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/LINK-NOK/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "LINK: %.2fkr\n" "$price"
    else
        echo "LINK: --NOK"
    fi
}

get_price

