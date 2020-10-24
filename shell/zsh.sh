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

cat >> ~/.zshrc.test <<EOF
export PATH="\${PATH}:\${HOME}/bin"

alias ls='ls --color=auto'
alias upgrade='yay -Syu'

typeset -g -A key

key[Home]="\${terminfo[khome]}"
key[End]="\${terminfo[kend]}"
key[Insert]="\${terminfo[kich1]}"
key[Backspace]="\${terminfo[kbs]}"
key[Delete]="\${terminfo[kdch1]}"
key[Up]="\${terminfo[kcuu1]}"
key[Down]="\${terminfo[kcud1]}"
key[Left]="\${terminfo[kcub1]}"
key[Right]="\${terminfo[kcuf1]}"
key[PageUp]="\${terminfo[kpp]}"
key[PageDown]="\${terminfo[knp]}"
key[Shift-Tab]="\${terminfo[kcbt]}"

# setup key accordingly
[[ -n "\${key[Home]}"      ]] && bindkey -- "\${key[Home]}"      beginning-of-line
[[ -n "\${key[End]}"       ]] && bindkey -- "\${key[End]}"       end-of-line
[[ -n "\${key[Insert]}"    ]] && bindkey -- "\${key[Insert]}"    overwrite-mode
[[ -n "\${key[Backspace]}" ]] && bindkey -- "\${key[Backspace]}" backward-delete-char
[[ -n "\${key[Delete]}"    ]] && bindkey -- "\${key[Delete]}"    delete-char
[[ -n "\${key[Up]}"        ]] && bindkey -- "\${key[Up]}"        up-line-or-history
[[ -n "\${key[Down]}"      ]] && bindkey -- "\${key[Down]}"      down-line-or-history
[[ -n "\${key[Left]}"      ]] && bindkey -- "\${key[Left]}"      backward-char
[[ -n "\${key[Right]}"     ]] && bindkey -- "\${key[Right]}"     forward-char
[[ -n "\${key[PageUp]}"    ]] && bindkey -- "\${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "\${key[PageDown]}"  ]] && bindkey -- "\${key[PageDown]}"  end-of-buffer-or-history
[[ -n "\${key[Shift-Tab]}" ]] && bindkey -- "\${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from \$terminfo valid.
if (( \${+terminfo[smkx]} && \${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


h=()
if [[ -r ~/.ssh/config ]]; then
  h=(\$h \${\${\${(@M)\${(f)"\$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ \$#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts \$h
  zstyle ':completion:*:slogin:*' hosts \$h
fi
EOF

echo "Change your default shell to ZSH:"
/usr/bin/chsh -s /bin/zsh ${USER}
