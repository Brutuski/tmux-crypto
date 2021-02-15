<h2 align="center">Tmux Plugin to Monitor Crytocurrency Prices</h2>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/ffc3e9311255426384cc76f805bc1ed436220545/assets/logo.svg" width="200" height="200"><p>
<p align="center">
        <img alt="Status" src="https://img.shields.io/badge/Maintained-Yes-44B273.svg">
        <img alt="License" src="https://img.shields.io/badge/LICENSE-MIT-1D918B.svg">
</p>
 <p align="center"><a href="https://www.buymeacoffee.com/asirohi"><img alt="Status" src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/8a44fec52097cede774504f5bdaca5386abac3cc/assets/bmc.svg" width="200" height="23"></p>

### Index
* [Getting Started](#getting-started)
* [Screenshots & Demo](#screenshots)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Options](#options)
* [Example](#example)
* [Changelog](#changelog)
* [Issues](#issues)
* [License](#license)
* [Logo Credit](#logo-credit)

#### Getting Started
Keep a tarck of crypto currencies right from tmux.
You can choose between the following fiat currencies:
- AUD → A$
- CAD → C$
- CHF → Fr
- DKK → kr
- EUR → €
- GBP → £
- NOK → kr
- SEK → kr
- USD → $

Current supported crypto currencies are:
- Cardano → ADA
- Bitcoin → BTC
- Polkadot → DOT
- Ethereum → ETH
- Chainlink → LINK
- Litecoin → LTC
- Nano → NANO

The data is fetched from [Kraken's API](https://www.kraken.com/features/api).
For some fiat currencies the data is fetched from [Exchange Rates API](https://github.com/exchangeratesapi/exchangeratesapi).
For more crypto currency requests, drop it [here](https://github.com/Brutuski/tmux-crypto/issues)

#### Screenshots
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/main/assets/demo.gif"><p>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/main/assets/screenshot1.png"><p>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/main/assets/screenshot2.png"><p>

Terminal and Tmux theme shown here is [Lighthaus](https://github.com/lighthaus-theme)

_Tmux Lighthaus theme coming soon_

#### Requirements
- [TPM](https://github.com/tmux-plugins/tpm) is the recommended method of installing this plugin
- [curl](https://curl.se/)
- [jq](https://stedolan.github.io/jq/)

#### Installation
**Recommended method:**
- Add plugin to your [TPM](https://github.com/tmux-plugins/tpm) plugins in your `.tmux.conf`
    * ``` vim
        set -g @plugin 'Brutuski/tmux-crypto'
      ```
- While inside a tmux session press `prefix + I` to reload and install the plugin.
- Add the desired _format strings_ to your status as such
    * ``` vim
        #{eth_eur}
      ```
- Reload the tmux config and the changes should take effect.

**Manual Installation:**
- Clone this repo
    * ``` vim
        git clone https://github.com/Brutuski/tmux-crypto.git ~/.tmux/tmux-crypto
      ```
- Add the following line to the bottom of your tmux config
    * ``` vim
        run-shell ~/.tmux/tmux-crypto/crypto.tmux
      ```
- Save the file and reload your tmux session.

#### Usage
- Add the desired _format strings_ to your status as such. All supported format strings listed below in [options](#options)
    * ``` vim
        #{eth_usd} #{btc_usd}
      ```
- Reload the tmux config and the changes should take effect.

#### Options
All available format strings and options can be found in [OPTIONS](https://github.com/Brutuski/tmux-crypto/blob/main/OPTIONS.md).

#### Example
Format strings can be edited to what the user needs.
_fg_ and _bg_ colors can be defined by the user as well.
``` vim
set -g status-left "......#[fg=#21252D,bg=#5AD1AA] #{eth_eur} | #{ada_eur} "
```

#### Changelog
``` vim
v1.1.1
```
Changes can be tracked in the [CHANGELOG](https://github.com/Brutuski/tmux-crypto/blob/main/CHANGELOG.md)

#### Issues
Please report any bugs or issues [here](https://github.com/Brutuski/tmux-crypto/issues).

#### License
[MIT](https://github.com/Brutuski/tmux-crypto/blob/main/LICENSE)

_Copyright (c) 2021 Adhiraj Sirohi_ 

#### Logo Credit
Logo was made by [Vasundhara Sharma](https://vasdesigns.de/) 
<a href="https://www.behance.net/vasundhsharma" target="blank"><img align="center" src="https://raw.githubusercontent.com/detain/svg-logos/780f25886640cef088af994181646db2f6b1a3f8/svg/behance-1.svg" alt="https://www.behance.net/vasundhsharma" height="40" width="40"/></a> <a href="https://keybase.io/vas_sharma" target="blank"><img align="center" src="https://www.vectorlogo.zone/logos/keybase/keybase-icon.svg" alt="https://keybase.io/vas_sharma" height="40" width="40"/></a>
