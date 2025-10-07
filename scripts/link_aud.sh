#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/LINK-AUD/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "LINK: %.2fA$\n" "$price"
    else
        echo "LINK: --AUD"
    fi
}

get_price

