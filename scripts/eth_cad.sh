#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/ETH-CAD/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "ETH: %.2fC$\n" "$price"
    else
        echo "ETH: --CAD"
    fi
}

get_price

