#!/bin/bash
 
# Environment Variables
export HOME=/home/dolohan
export TOOLS="/opt/toolZ"
export ADDONS="/opt/addons"
export WORDLISTS="/opt/wordlists"
export DEBIAN_FRONTEND=noninteractive

# Create working dirs
mkdir $WORDLISTS && mkdir $ADDONS

# --- Common Dependencies ---
# Install Essentials
apt-get update && \
  apt-get install -y --no-install-recommends --fix-missing \
  apt-utils \
  awscli \
  build-essential \
  curl \
  dnsutils \
  gcc \
  git \
  iputils-ping \
  jq \
  libgmp-dev \
  libpcap-dev \
  make \
  micro \
  netcat \
  net-tools \
  nodejs \
  npm \
  perl \
  php \
  proxychains \
  python3 \
  python3-pip \
  ssh \
  tor \
  tmux \
  tzdata \
  wget \
  whois \
  zip \
  unzip \
  zsh && \
  echo "Placeholder"

# Install tools & dependencies
apt-get update && \
  apt-get install -y --no-install-recommends --fix-missing \
  brutespray \
  crunch \
  dirb \
  ftp \
  hping3 \
  hydra \
  nikto \
  nmap \
  smbclient \
  sqlmap \
  libssl-dev \
  yasm \
  pkg-config \
  libbz2-dev \
  gnupg2 \
  openvpn \
  easy-rsa \
  libcurl4-openssl-dev \
  libxml2 \
  libxml2-dev \
  libxslt1-dev \
  ruby-dev \
  zlib1g-dev \
  fonts-powerline \
  powerline && \
  echo "Placeholder"

# Install languages eg python go, rust etc
# Install go
wget https://git.io/go-installer.sh && bash go-installer.sh

# Install Python common dependencies
python3 -m pip install --upgrade setuptools wheel paramiko

# shell and prompt setup
# Install configured ZSH
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

#install fig
curl -fSsL https://repo.fig.io/scripts/install-headless.sh | bash
echo "REMEMBER to login to fig: fig login"

# --- Tools ---

# breach-parse
git clone --depth 1 https://github.com/hmaverickadams/breach-parse.git $TOOLS/breach-parse && \
  cd $TOOLS/breach-parse && \
  chmod a+x breach-parse.sh && \
  ln -sf $TOOLS/breach-parse/breach-parse.sh /usr/local/bin/breach-parse

# cloudflair
git clone --depth 1 https://github.com/christophetd/CloudFlair.git $TOOLS/cloudflair && \
  cd $TOOLS/cloudflair && \
  python3 -m pip install -r requirements.txt && \
  sed -i 's^#!/usr/bin/env python3^#!/usr/bin/python3^g' cloudflair.py && \
  chmod a+x cloudflair.py && \
  ln -sf $TOOLS/cloudflair/cloudflair.py /usr/local/bin/cloudflair

# commix
git clone --depth 1 https://github.com/commixproject/commix.git $TOOLS/commix && \
  cd $TOOLS/commix && \
  sed -i 's^#!/usr/bin/env python^#!/usr/bin/python3^g' commix.py && \
  chmod a+x commix.py && \
  ln -sf $TOOLS/commix/commix.py /usr/local/bin/commix

# cupp
git clone --depth 1 https://github.com/Mebus/cupp.git $TOOLS/cupp && \
  cd $TOOLS/cupp && \
  chmod a+x cupp.py && \
  ln -sf $TOOLS/cupp/cupp.py /usr/local/bin/cupp

# dalfox
git clone --depth 1 https://github.com/hahwul/dalfox.git $TOOLS/dalfox && \
  cd $TOOLS

    IP space discovery
    TLDs, Acquisitions, & Relations
    Subdomain Enum
    Fingerpirnting
    Dorking
    Content Discovery
    Parameter Discovery
/dalfox && \
  go install

# dnmasscan
git clone --depth 1 https://github.com/rastating/dnmasscan.git $TOOLS/dnmasscan && \
  cd $TOOLS/dnmasscan && \
  chmod a+x dnmasscan && \
  ln -sf $TOOLS/dnmasscan/dnmasscan /usr/local/bin/dnmasscan

# exploitdb (searchsploit)
git clone --depth 1 https://github.com/offensive-security/exploitdb.git $TOOLS/exploitdb && \
  cd $TOOLS/exploitdb && \
  ln -sf $TOOLS/exploitdb/searchsploit /usr/bin/searchsploit

# interlace
git clone --depth 1 https://github.com/codingo/Interlace.git $TOOLS/interlace && \
  cd $TOOLS/interlace && \
  python3 -m pip install -r requirements.txt && \
  python3 setup.py install && \
  chmod a+x Interlace/interlace.py && \
  ln -sf $TOOLS/interlace/Interlace/interlace.py /usr/local/bin/interlace

# jwttool
git clone --depth 1 https://github.com/ticarpi/jwt_tool $TOOLS/jwttool && \
  cd $TOOLS/jwttool && \
  python3 -m pip install pycryptodomex termcolor && \
  chmod a+x jwt_tool.py && \
  ln -sf $TOOLS/jwttool/jwt_tool.py /usr/local/bin/jwttool

# link finder
git clone --depth 1 https://github.com/GerbenJavado/LinkFinder.git $TOOLS/linkfinder && \
  cd $TOOLS/linkfinder && \
  python3 -m pip install -r requirements.txt && \
  python3 setup.py install && \
  sed -i 's^#!/usr/bin/env python^#!/usr/bin/python3^g' linkfinder.py && \
  chmod a+x linkfinder.py && \
  ln -sf $TOOLS/linkfinder/linkfinder.py /usr/local/bin/linkfinder

# masscan
git clone --depth 1 https://github.com/robertdavidgraham/masscan.git $TOOLS/masscan && \
  cd $TOOLS/masscan && \
  make -j && \
  ln -sf $TOOLS/masscan/bin/masscan /usr/local/bin/masscan

# nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest && \
  git clone --depth 1 https://github.com/projectdiscovery/nuclei-templates.git $ADDONS/nuclei

# pagodo
git clone --depth 1 https://github.com/opsdisk/pagodo.git $TOOLS/pagodo && \
  cd $TOOLS/pagodo && \
  python3 -m pip install -r requirements.txt && \
  sed -i 's^#!/usr/bin/env python^#!/usr/bin/python3^g' pagodo.py && \
  python3 ghdb_scraper.py -j -s && \
  chmod a+x pagodo.py && \
  ln -sf $TOOLS/pagodo/pagodo.py /usr/local/bin/pagodo

# recon-ng
git clone --depth 1 https://github.com/lanmaster53/recon-ng.git $TOOLS/recon-ng && \
  cd $TOOLS/recon-ng && \
  python3 -m pip install -r REQUIREMENTS && \
  chmod a+x recon-ng && \
  ln -sf $TOOLS/recon-ng/recon-ng /usr/local/bin/recon-ng

# sherlock
git clone --depth 1 https://github.com/sherlock-project/sherlock $TOOLS/sherlock && \
  cd $TOOLS/sherlock && \
  python3 -m pip install -r requirements.txt && \
  chmod a+x sherlock/sherlock.py && \
  ln -sf $TOOLS/sherlock/sherlock/sherlock.py /usr/local/bin/sherlock

# social engineer toolkit
git clone --depth 1 https://github.com/trustedsec/social-engineer-toolkit $TOOLS/setoolkit && \
  cd $TOOLS/setoolkit && \
  python3 -m pip install -r requirements.txt || : && \
  python3 setup.py || :

# sublist3r
git clone --depth 1 https://github.com/aboul3la/Sublist3r.git $TOOLS/sublist3r && \
  cd $TOOLS/sublist3r && \
  python3 -m pip install -r requirements.txt && \
  sed -i 's^#!/usr/bin/env python^#!/usr/bin/python3^g' sublist3r.py && \
  chmod a+x sublist3r.py && \
  ln -sf $TOOLS/sublist3r/sublist3r.py /usr/local/bin/sublist3r

# theharvester
# Note: it needs to be installed in /etc/ as there are absolute refs in the code
git clone --depth 1 https://github.com/laramies/theHarvester /etc/theHarvester && \
  cd /etc/theHarvester && \
  python3 -m pip install pipenv && \
  python3 -m pip install -r requirements/base.txt && \
  sed -i 's^#!/usr/bin/env python3^#!/usr/bin/python3^g' theHarvester.py && \
  chmod a+x theHarvester.py && \
  ln -sf /etc/theHarvester/theHarvester.py /usr/local/bin/theharvester

# wafw00f
git clone --depth 1 https://github.com/enablesecurity/wafw00f.git $TOOLS/wafw00f && \
  cd $TOOLS/wafw00f && \
  chmod a+x setup.py && \
  python3 setup.py install  

# whatweb
git clone --depth 1 https://github.com/urbanadventurer/WhatWeb.git $TOOLS/whatweb && \
  cd $TOOLS/whatweb && \
  chmod a+x whatweb && \
  ln -sf $TOOLS/whatweb/whatweb /usr/local/bin/whatweb

# wpscan
gem install wpscan

# xsstrike
git clone --depth 1 https://github.com/s0md3v/XSStrike.git $TOOLS/xsstrike && \
  cd $TOOLS/xsstrike && \
  python3 -m pip install -r requirements.txt && \
  chmod a+x xsstrike.py && \
  ln -sf $TOOLS/xsstrike/xsstrike.py /usr/local/bin/xsstrike
/etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list

# seclists
 git clone --depth 1 https://github.com/danielmiessler/SecLists.git $WORDLISTS/seclists

# rockyou
curl -L https://github.com/praetorian-code/Hob0Rules/raw/db10d30b0e4295a648b8d1eab059b4d7a567bf0a/wordlists/rockyou.txt.gz \
  -o $WORDLISTS/rockyou.txt.gz && \
  gunzip $WORDLISTS/rockyou.txt.gz

# Symlink other wordlists
ln -sf $( find /go/pkg/mod/github.com/\!o\!w\!a\!s\!p/\!amass -name wordlists ) $WORDLISTS/amass && \
  ln -sf /usr/share/brutespray/wordlist $WORDLISTS/brutespray && \
  ln -sf /usr/share/dirb/wordlists $WORDLISTS/dirb && \
  ln -sf /usr/share/setoolkit/src/fasttrack/wordlist.txt $WORDLISTS/fasttrack.txt && \
 # ln -sf /opt/metasploit-framework/embedded/framework/data/wordlists $WORDLISTS/metasploit && \
  ln -sf /usr/share/nmap/nselib/data/passwords.lst $WORDLISTS/nmap.lst && \
  ln -sf /etc/theHarvester/wordlists $WORDLISTS/theharvester

# --- Other utilities ---

# wORDLISTS

# Kali reverse shells
git clone --depth 1 https://gitlab.com/kalilinux/packages/webshells.git /usr/share/webshells && \
  ln -s /usr/share/webshells $ADDONS/webshells

# Copy the startup script across

# --- Config ---

# Easier to access list of nmap scripts
ln -s /usr/share/nmap/scripts/ $ADDONS/nmap

# Common commands (aliases)
echo "alias myip='dig +short myip.opendns.com @resolver1.opendns.com'" >> ~/.zshrc
echo "alias c='clear'"


# --- Finished ---

# Start up commands
echo "export PATH=${PATH}" >> ~/.zshrc
chsh -s $(which zsh)
