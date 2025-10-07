#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/KSM-CAD/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "KSM: %.2fC$\n" "$price"
    else
        echo "KSM: --CAD"
    fi
}

get_price

