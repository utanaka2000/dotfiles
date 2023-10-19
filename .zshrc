autoload -Uz compinit && compinit

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='%c'\$vcs_info_msg_0_'$ '
precmd(){ vcs_info }

setopt auto_cd
setopt auto_param_slash
setopt auto_pushd
setopt auto_remove_slash
setopt extended_glob
setopt function_argzero
setopt ignore_eof
setopt list_types
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt sun_keyboard_hack
setopt print_eight_bit
setopt complete_in_word
setopt no_nomatch
setopt share_history
setopt extended_history
setopt nohup
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt no_beep

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F -G'
alias ls-a='ls -aFG'
alias dpython='python3 -m ipdb -c continue'

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export LSCOLORS='gxfxcxdxbxegexabagacad'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# peco
function peco-history-selection() {
   BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
   CURSOR=$#BUFFER
   zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection


fpath=( $HOME/.zsh/zsh-completions/src $fpath)
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# 最後にしろとのこと
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
