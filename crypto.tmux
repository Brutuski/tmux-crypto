#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

crypto_commands=(
  "#($CURRENT_DIR/scripts/ada_usd.sh)"
  "#($CURRENT_DIR/scripts/ada_eur.sh)"
  "#($CURRENT_DIR/scripts/btc_usd.sh)"
  "#($CURRENT_DIR/scripts/btc_eur.sh)"
  "#($CURRENT_DIR/scripts/dot_usd.sh)"
  "#($CURRENT_DIR/scripts/dot_eur.sh)"
  "#($CURRENT_DIR/scripts/eth_usd.sh)"
  "#($CURRENT_DIR/scripts/eth_eur.sh)"
  "#($CURRENT_DIR/scripts/link_usd.sh)"
  "#($CURRENT_DIR/scripts/link_eur.sh)"
  "#($CURRENT_DIR/scripts/ltc_usd.sh)"
  "#($CURRENT_DIR/scripts/ltc_eur.sh)"
  "#($CURRENT_DIR/scripts/nano_usd.sh)"
  "#($CURRENT_DIR/scripts/nano_eur.sh)"
)

crypto_interpolation=(
	"\#{ada_usd}"
	"\#{ada_eur}"
	"\#{btc_usd}"
	"\#{btc_eur}"
	"\#{dot_usd}"
	"\#{dot_eur}"
	"\#{eth_usd}"
	"\#{eth_eur}"
	"\#{link_usd}"
	"\#{link_eur}"
	"\#{ltc_usd}"
	"\#{ltc_eur}"
	"\#{nano_usd}"
	"\#{nano_eur}"
)

set_tmux_options() {
	local option="$1"
	local value="$2"
	tmux set-option -gp "$option" "$value"
}

do_interpolation() {
	local interpolated="$1"

	for ((i=0; i<${#crypto_commands[@]}; i++)); do
		interpolated=${interpolated/${crypto_interpolation[$i]}/${crypto_commands[$i]}}
	done

	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main

