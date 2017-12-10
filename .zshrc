#string Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/michel/.zshrc'




autoload -Uz compinit promptinit colors chpwd_recent_dirs cdr add-zsh-hook
compinit
promptinit
colors
add-zsh-hook chpwd chpwd_recent_dirs
#promptinit
# End of lines added by compinstall
#
#
#prompt cloud
#
# %{, %} -> zaehlt nicht in prompt-laenge, sonst buggts.
# %# -> prompt, in meinem Fall idr das "%" am ende
# %~ -> pwd
# PROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}%# "
# To include Hostname:
PROMPT="%{$fg[cyan]%}[%m:%~]%{$reset_color%}%# "

case $TERM in
	  (*xterm* | *rxvt*)

strlen () {
    FOO=$1
    local zero='%([BSUbfksu]|([FB]|){*})'
    LEN=${#${(S%%)FOO//$~zero/}}
    echo $LEN
}
# Write some info to terminal title.
# This is seen when the shell prompts for input.
function precmd {
     print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
}
# Write command and args to terminal title.
# This is seen while the shell waits for a command to complete.
function preexec {
     printf "\033]0;%s\a" "$1"
    
     DATE=$( date +"[%H:%M:%S]" )
     local len_right=$( strlen "$DATE" )
     len_right=$(( $len_right+1 ))
     local right_start=$(($COLUMNS - $len_right))

     local len_cmd=$( strlen "$@" )
     local len_prompt=$(strlen "$PROMPT" )
     local len_left=$(($len_cmd+$len_prompt))

     RDATE="\033[${right_start}C $fg[cyan]${DATE}$reset_color"

     if [ $len_left -lt $right_start ]; then
         # command does not overwrite right prompt
         # ok to move up one line
         echo -e "\033[1A${RDATE}"
     else
         echo -e "${RDATE}"
     fi
}

;;
esac

alias ls='ls --color=auto'

# Standard Editor
export EDITOR=vim

alias la='ls -a'
alias ll='ls -lh'
alias pacman-autoremove='sudo pacman -R $(pacman -Qdtq)'
alias du='du -h'
alias df='df -h'
alias ldu='du -h -d 1'
alias randhex64='openssl rand 32 -hex'
alias geth='geth --fast --cache=512'
alias g='grep --color'
alias tmux='[[ $TMUX ]] || tmux attach || tmux'
alias pdflatex='pdflatex -interaction=errorstopmode -shell-escape'
alias exiftool='exiftool -all='
alias py=python3

function cats() {
pygmentize $1 | perl -e 'print "\e[90m".sprintf("%4d",++$i)."|\e[39m $_" for <>'
}

function ssh() {/usr/bin/ssh $@ -t "tmux attach || tmux || screen -r || screen -q";}
TERM=xterm

function logentry {

    if [ -z "$1" ] ; then
        project=beamfox
    else
        project=$1
    fi
    echo $project

    logdir=~/Nextcloud/Logbook
    if [ ! -d $project ] ; then
        mkdir $logdir/$project
    fi

    today=`date +%Y-%m-%d`
    logfile=$logdir/$project/$today.md
    if [ ! -f $logfile ]; then
        echo "# Log entry ${today}" > $logfile
    fi
    vim $logfile
}

# BASE16 Color Sheme Changer
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

function _focus_left {
i3-msg focus left >\dev\null
}
zle -N _focus_left
function _focus_right {
i3-msg focus right >\dev\null
}
zle -N _focus_right
function _focus_up {
i3-msg focus up >\dev\null
}
zle -N _focus_up
function _focus_down {
i3-msg focus down >\dev\null
}
zle -N _focus_down

bindkey -v
bindkey "\e[3~" delete-char
bindkey "^h"  _focus_left
bindkey "^l"  _focus_right
bindkey "^k"  _focus_up
bindkey "^j"  _focus_down
