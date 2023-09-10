#!/usr/bin/zsh

go install -v github.com/haccer/subjack@latest
go install -v github.com/lc/subjs@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/tomnomnom/unfurl@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest && \
  git clone --depth 1 https://github.com/projectdiscovery/nuclei-templates.git $ADDONS/nuclei
go install -v github.com/tomnomnom/meg@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/lc/gau/v2/cmd/gau@latest && \
  echo "alias gau='/go/bin/gau'" >> ~/.zshrc
go install github.com/ffuf/ffuf@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
git clone --depth 1 https://github.com/hahwul/dalfox.git $TOOLS/dalfox && \
  cd $TOOLS/dalfox && \
  go install
go install -v github.com/owasp-amass/amass/v3/...@master
go install github.com/003random/getJS@latest
