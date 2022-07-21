#=====
# Oh-My-Zsh
#=====

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(
    git
    notify
    alias-tips
    colored-man-pages
)

autoload -Uz compinit
compinit

ZSH_THEME=""

[[ -e $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

#========
# Zsh Syntax Highlighting & Autosuggestions; Installed via Homebrew
#========

[[ -e "$HOMEBREW_PREFIX/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -e "$HOMEBREW_PREFIX/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

#========
# Pure Prompt
#========

fpath+=/opt/homebrew/share/zsh/site-functions # this is needed for m1 installation
autoload -U promptinit
promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

#========
# iTerm2 & Shell Integration
#========

[[ -e "$HOME/.config/iterm2/.iterm2_shell_integration.zsh" ]] && source "$HOME/.config/iterm2/.iterm2_shell_integration.zsh"

#=======
# Aliases
#=======

alias dr="yadm bootstrap" # dotfiles refresh/rerun
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # copy public key to clipboard
alias zf="nvim ~/.zshrc"
alias vf="nvim ~/.config/nvim/init.vim" 
alias rl="source ~/.zshrc"
alias j="fasd_cd -d"
alias ow="find *.xcworkspace | head -n 1 | xargs open"
alias to="tuist generate"
alias te="tuist edit"
alias edit="nvim"
alias e="nvim"
alias lt="exa -las type"
alias ddc="sudo rm -rf ~/Library/Developer/Xcode/DerivedData"
alias gg="git log --oneline --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gds="git diff --staged"
alias gchrn="git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort -n"
alias grs="git restore --staged ."
alias gr="git reset HEAD && git checkout ."
# alias gclp="cd $(pbpaste | xargs -I repo bash -c 'git clone repo  && basename repo .git')" # Надо попробовать переписать
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias sshkcopy="pbcopy < ~/.ssh/id_ed25519.pub"

#=======
# Notify
#=======

zstyle ':notify:*' success-title "Success!"
zstyle ':notify:*' error-title "Error!"
zstyle ':notify:*' error-icon "https://media3.giphy.com/media/10ECejNtM1GyRy/200_s.gif"
zstyle ':notify:*' success-icon "https://s-media-cache-ak0.pinimg.com/564x/b5/5a/18/b55a1805f5650495a74202279036ecd2.jpg"

#======
# To being able to move using shift and control
#======

setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

#=======
# Fzf
#=======

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#=======
# Fasd
#=======

eval "$(fasd --init auto)"

#=======
# Other
#=======

export PATH=$HOME/bin:/usr/local/bin:$PATH

#=======
# NVM
#=======

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#=======
# RVM
#=======
#
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#=======
# SDKMAN
#=======
#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

