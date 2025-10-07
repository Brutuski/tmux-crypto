#!/usr/bin/env bash

get_price() {
    local price
    price=$(curl -s 'https://api.coinbase.com/v2/prices/NANO-GBP/spot' \
            | jq -r '.data.amount' 2>/dev/null)

    if [[ -n "$price" && "$price" != "null" ]]; then
        printf "NANO: %.2f£\n" "$price"
    else
        echo "NANO: --GBP"
    fi
}

get_price

