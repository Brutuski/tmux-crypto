#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/LINK-EUR/spot' \
            | jq -r '.data.amount' 2>/dev/null)
    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "LINK: %.2f€\n" "$price"
    else
        echo "LINK: --€"
    fi
}

get_price

