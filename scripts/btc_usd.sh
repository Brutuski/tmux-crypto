#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/BTC-USDC/spot' \
            | jq -r '.data.amount' 2>/dev/null)
    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "BTC: %.2f$\n" "$price"
    else
        echo "BTC: --$"
    fi
}

get_price

