#!/usr/bin/zsh

echo "RUN IN SUDO OR WILL NOT WORK!!!"

# Environment Variables
export HOME=/home/dolohan
export TOOLS="/opt/toolZ"
export ADDONS="/opt/addons"
export WORDLISTS_PAYLOADS="/opt/wordlists"
export DEBIAN_FRONTEND=noninteractive

# --- MORE BUG BOUNTY TOOLS ---

# Katana - project Discovery
go install github.com/projectdiscovery/katana/cmd/katana@latest

# Dork-Searcher
git clone https://github.com/ConfusedCharacter/Dork-Searcher $TOOLS/Dork-Searcher
cd $TOOLS/Dork-Searcher
go run main.go

# dora ripgrep etc
git clone https://github.com/sdushantha/dora.git $TOOLS/dora
cd $TOOLS/dora 
python3 setup.py install --user

# Oralyzer - Open Redirect Analyzer
git clone https://github.com/r0075h3ll/Oralyzer.git $TOOLS/oralyzer
cd $TOOLS/Oralyzer
pip3 install -r requirements.txt


# --- Wordlists ---

# Payloads

# tiny xss plz
git clone https://github.com/terjanq/Tiny-XSS-Payloads.git $WORDLISTS_PAYLOADS/tiny-xss

# Weaponized XSS Payloads in JS by HakLuke
https://github.com/hakluke/weaponised-XSS-payloads.git $WORDLISTS_PAYLOADS/weaponized-xss-hakluke

# XSS Payload generator
git clone https://github.com/capture0x/XSS-LOADER/ $WORDLISTS_PAYLOADS/XSS-LOADER
cd $WORDLISTS_PAYLOADS/XSS-LOADER
pip3 install -r requirements.txt

# Payload Encoder
pip install WebPayloadsEncodings

# PenCode Complex payload encoder
go install github.com/ffuf/pencode/cmd/pencode@latest