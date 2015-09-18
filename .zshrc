## Lines configured by zsh-newuser-install
##HISTFILE=~/.zsh_history
##HISTSIZE=1000000
##SAVEHIST=1000000
## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall
##zstyle :compinstall filename '/home/t/t51063/.zshrc'

##autoload -Uz compinit
##compinit
## End of lines added by compinstall

##http://qiita.com/kotashiratsuka/items/ae37757aa1d31d1d4f4d

# use complement
autoload -U compinit promptinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

# complement without distinction of big or small letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# use color for complement
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# use color for kill 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# complement when sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# use editor built in zsh
autoload -U zcalc
autoload zed

# forecast input
#autoload predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^X^P' predict-on
#bindkey '^O' predict-off
#zstyle ':predict' verbose true

# activate complement of history when halfway of input
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# complement of history when halfway of input
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# set incremental search
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

# available wildcard when incremental search for history
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# about prompt
PROMPT="[%n@%m %1~]%(!.#.$) "
#PROMPT="[%n@%m %~]%(!.#.$) "
#PROMPT2="%n %_%%"
#SPROMPT="%r is correct? [n,y,a,e]: "
#RPROMPT="[%l/zsh]"

# set history size
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
PATH=${PATH}:~/bin

# readable history list
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# don't ask too many complement list
LISTMAX=1000

#"|,:" are not a part of words
WORDCHARS="$WORDCHARS|:"

#http://www.ayu.ics.keio.ac.jp/~mukai/translate/zshoptions.html
# menu complement automatically by striking tab key repeatedly
setopt AUTO_MENU
# cd by direct dirname
setopt AUTO_CD
# access a directory by "~$var"
setopt AUTO_NAME_DIRS
# 
unsetopt AUTO_REMOVE_SLASH
# listup automatically with ambiguous complement
setopt AUTO_LIST
# complement varname
setopt AUTO_PARAM_KEYS
# expand prompt string
setopt PROMPT_SUBST
# resume when you input command same as suspended process
setopt AUTO_RESUME
# donot affirm rm * 
#setopt rm_star_silent
# set / when filename match directory
setopt MARK_DIRS
#
#rm *
#unsetopt RM_STAR_WAIT
# ignore ` at end of line
setopt SUN_KEYBOARD_HACK
# use matching without ~hoge
setopt EXTENDED_GLOB
# set distinction mark at end of file
setopt LIST_TYPES
# no BEEP
#setopt NO_BEEP
# display complement option in-situ, and 
setopt ALWAYS_LAST_PROMPT
#cd kota = /home/kota
setopt CDABLE_VARS
# 
setopt SH_WORD_SPLIT
# automatically export all variables defined
setopt ALL_EXPORT
# set / when dir name is complemented
setopt AUTO_PARAM_SLASH
# stack normal cd
setopt AUTO_PUSHD
# correct spell of command
setopt CORRECT
# expand alias in complement
unsetopt complete_aliases
#"*" match dot files
unsetopt GLOB_DOTS
# display complement options by packed form
setopt LIST_PACKED
# donot put directry stack if name is equal
setopt PUSHD_IGNORE_DUPS
# donot beep when complement
setopt NO_LIST_BEEP
# donot logout by ^D 
unsetopt IGNORE_EOF
# inform job states immediately
setopt NOTIFY
# pipe, redirect 
setopt MULTIOS
# 
setopt NUMERIC_GLOB_SORT
# donot overwrite with redirect
unsetopt NOCLOBBER
# complement after =
setopt MAGIC_EQUAL_SUBST
# correct display Japanese lists
setopt PRINT_EIGHT_BIT
# 
setopt TRANSIENT_RPROMPT
# display exit value if return value is not 0
unsetopt PRINT_EXIT_VALUE
# echo {a-z} 
setopt BRACE_CCL
# confirm !! before execution
setopt HISTVERIFY
# 
setopt HIST_IGNORE_SPACE
# donot overwrite historyfile
setopt APPEND_HISTORY
# for exit
setopt NO_CHECK_JOBS
# set time information to history
setopt EXTENDED_HISTORY
# 
setopt HIST_EXPIRE_DUPS_FIRST
#
setopt HIST_FIND_NO_DUPS
#
setopt HIST_NO_FUNCTIONS
#
setopt HIST_IGNORE_DUPS
#
setopt HIST_IGNORE_ALL_DUPS
#
unsetopt HIST_VERIFY
#
setopt INC_APPEND_HISTORY
#
setopt HIST_NO_STORE
#
setopt HIST_REDUCE_BLANKS
#
setopt NO_PROMPTCR
# allow short form of loop
setopt SHORT_LOOPS
#
unsetopt XTRACE
#
unsetopt AUTOREMOVESLASH
# chase real body of symbolic link
unsetopt CHASE_LINKS
# 
setopt SHARE_HISTORY
# $0 eat script / shell fuction name
setopt FUNCTION_ARGZERO
# donot use flow-control by Ctrl+S/Ctrl+Q 
setopt NO_FLOW_CONTROL
# after "#" is comment, even in command line
setopt INTERACTIVE_COMMENTS
# 
unsetopt SINGLE_LINE_ZLE
# 
setopt COMPLETE_IN_WORD
# inform the end of background job
setopt NO_TIFY


#
bindkey -e

#C-U
bindkey "^U" backward-kill-line

# C-^
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '^^' cdup

#tty
#setterm -blank 0

#
#Ctrl+H 
#stty erase '^H'
#Ctrl+C
#stty intr '^C'
# Ctrl+Z
#stty susp '^Z'

# 
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

#zsh Git
# display the Git branch name in PROMPT ( for zsh version higher than 4.3.6)
#autoload -Uz vcs_info
#zstyle ":vcs_info:*" enable git
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "+"
#zstyle ':vcs_info:git:*' unstagedstr "-"
#zstyle ':vcs_info:git:*' actionformats '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f%F{1}%u%f%F{6}%c%f'
#zstyle ':vcs_info:git:*' formats       '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{5}]%F{1}%u%f%F{6}%c%f'
#precmd() { vcs_info }
#RPROMPT='${vcs_info_msg_0_}%f'

# by K247
alias hisless='history -i -100 | less'
alias hislessa='history -i 1 | less'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
