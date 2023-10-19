# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zero/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#Alias 

alias ll="ls -l"
alias la="ls -la"
alias update="sudo pacman -Syu"
alias update-full="sudo pacman -Syyu"

source ~/zsh/themes/basic_color.zsh-theme

source ~/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
