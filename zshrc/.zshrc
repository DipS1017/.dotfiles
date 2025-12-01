# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"



plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
# fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc
#fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Open Neovim in a new tmux session if not already in tmux
alias tvim='tmux new-session  -s nvim "nvim"'
# Load Rust environment (Cargo)
#. "$HOME/.cargo/env"

bindkey '^I' autosuggest-accept

export PATH="$HOME/.cargo/bin:$PATH"

PATH="$PATH":"$HOME/.local/scripts/"
bindkey -s ^f "tmux-sessionizer\n"
export PATH="$PATH:$HOME/go/bin"

export PATH=$HOME/.config/composer/vendor/bin:~/.composer/vendor/bin:$PATH


#export ANDROID_SDK_ROOT=/opt/android-sdk
#export PATH=$PATH:/opt/android-sdk/platform-tools
#export PATH=$PATH:/opt/android-sdk/emulator
#export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin

# Avante private API keys
[ -f ~/.config/avante/env ] && source ~/.config/avante/env
eval "$(starship init zsh)"
