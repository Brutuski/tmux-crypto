#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/ADA-USDC/spot' \
            | jq -r '.data.amount' 2>/dev/null)
    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "ADA: %.2f$\n" "$price"
    else
        echo "ADA: --$"
    fi
}

get_price

