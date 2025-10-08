#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/NANO-CHF/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "NANO: %.2fFr\n" "$price"
    else
        echo "NANO: --CHF"
    fi
}

get_price

