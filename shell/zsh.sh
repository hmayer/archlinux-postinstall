#!/bin/bash
#
# Install ZSH shell
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

# Installing zsh properly
arch-install zsh
arch-install ttf-meslo-nerd-font-powerlevel10k
arch-install zsh-theme-powerlevel10k
arch-install zsh-autosuggestions
arch-install zsh-completions

echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo 'source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

echo "Change your default shell to ZSH:"
/usr/bin/chsh -s /bin/zsh ${USER}
