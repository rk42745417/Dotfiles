

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ****************************************************************************************************



# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' original true
zstyle :compinstall filename '/home/jikuai/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install

# ****************************************************************************************************

alias tmux="TERM=xterm-256color tmux"
export PATH="$HOME/Packages/image/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# source ~/Util/adjust_time.sh

# Personal settings
alias ls='colorls'
alias lc='colorls -lA --sd'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias find='fd'

alias sl='ls'
alias vm='mv'
alias difi='diff'
alias mkdri='mkdir'
alias rmdri='rmdir'
bindkey "^[j" history-beginning-search-forward
bindkey "^[k" history-beginning-search-backward
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
alias history='history -E'

export EDITOR='nvim'
source $HOME/.bin/startup_script/*

# Turn off all beeps
unsetopt BEEP

# End of personal settings

# ****************************************************************************************************

# Start using zplug
source ~/.zplug/init.zsh
# Install plugins
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/npm", from:oh-my-zsh
zplug "chrissicool/zsh-256color"
# zplug "unixorn/git-extra-commands"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
# zplug "plugins/copypath", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "ael-code/zsh-colored-man-pages"
zplug "jedahan/geometry-hydrate"
# zplug "Bhupesh-V/ugit"
zplug "MichaelAquilina/zsh-you-should-use"

# colorls
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
# source $(dirname $(gem which colorls))/tab_complete.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# plugin configurations
GEOMETRY_PLUGIN_HYDRATE_INTERVAL=40  # interval in minutes

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ****************************************************************************************************

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
