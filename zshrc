# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ****************************************************************************************************

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/jikuai/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
bindkey -e
# End of lines configured by zsh-newuser-install

# ****************************************************************************************************

# Personal settings
alias ls='colorls'
alias lc='colorls -lA --sd'
alias diff='diff --color=auto'
alias rm='rm -i'

alias sl='ls'
alias vm='mv'
alias difi='diff'
alias mkdri='mkdir'
alias rmdri='rmdir'

export EDITOR=vim
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
} # source: https://www.reddit.com/r/ranger/comments/bngtqt/comment/ig8ux7c
alias ranger="rangercd"

# Unlimited stack size
# For programming, especially Competitive Programming
ulimit -s unlimited

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
source $(dirname $(gem which colorls))/tab_complete.sh

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

# ****************************************************************************************************

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
