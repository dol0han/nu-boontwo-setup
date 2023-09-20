#!//bin/bash

# shell and prompt setup
# Install configured ZSH
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

if [[ -e /home/dolohan/.zshrc ]]; then
    echo ".zshRC exists!"
    echo "alias myip='dig +short myip.opendns.com @resolver1.opendns.com'" >> ~/.zshrc
    echo "alias c='clear'" >> ~/.zshrc
    echo "alias ll=ls -lah" >> ~/.zshrc
    echo "export PATH=${PATH}" >> ~/.zshrc

else
    echo "huh bro"
fi
