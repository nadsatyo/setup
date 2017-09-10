#!/bin/bash
#-------------------------------------------------- 
# .bashrc
#-------------------------------------------------- 
# First, check whether we're in interactive mode and bail if not
if [[ "$-" != *i* ]]
then
	# everything from here on out is for interactive shells
	return
fi


stty intr ^C
HISTCONTROL=ignoredups
EDITOR=vim
OSTYPE=$(uname -s)

export FCEDIT="vim"
export EDITOR="vim"

#--------------------------------------------------
# Path
#-------------------------------------------------- 

#--------------------------------------------------
# Options
#-------------------------------------------------- 
# Annoying... but i can be careless
set -o noclobber on
set -o vi


#-------------------------------------------------- 
# Source files
#-------------------------------------------------- 
. ~/.bashfnc


#--------------------------------------------------
# Aliases
#-------------------------------------------------- 
alias perl_traceerror='perl -MCarp::Always'
alias docker='sudo docker'

#tmux
source ~/.tmuxinator.bash
alias tmux-n=' echo $ tmux new-session -s; tmux new-session -s'
alias tmux-ls='echo $ tmux ls;             tmux ls'
alias tmux-a=' echo $ tmux attach -t;      tmux attach -t'
alias tmux-src=' echo $ tmux source-file ~/.tmux.conf;  tmux source-file ~/.tmux.conf'
alias srctmux="tmux source-file ~/.tmux.conf"
alias vitmux='vim ~/.tmux.conf'

#misc
alias r="fc -s"
alias du.='du -sh .'
alias cls='clear'
alias dusumm='du -h --max-depth=1'
alias dusumm2='du --max-depth=1 | sort -n'

alias cleandir_off='echo find . -type f -exec rm {} \; -print'
alias all2unix='find . -type f -exec dos2unix {} {} \;'

# ls aliases
alias ls="ls --color=auto -F"
alias l="ls -C"
alias l.="ls .[a-zA-Z]* -d"
alias ll.="ll .[a-zA-Z]*"
alias ll="ls -l"
alias lt="ll -t"
alias la="ls -FCa --color=auto"
alias lla="ls -la --color=auto"
alias lta="ls -lt --color=auto"
alias lr="ls -FC --dereference --color=auto"
alias llr="ls -l --dereference --color=auto"
alias lar="ls -FCa --dereference --color=auto"
alias llar="ls -la --dereference --color=auto"

alias tree="tree -C"
alias grep="grep --color"
alias grepcpp="grep -R --include='*.cpp'"
alias greph="grep -R --include='*.h'"
alias greppl="grep -R --include='*.pl'"
alias greppm="grep -R --include='*.pm'"
alias greppy="grep -R --include='*.py'"

#-- Misc
alias notes='cat ~/.notes.txt'
alias editnotes='vi ~/.notes.txt +10000'
alias src='. ~/.bashrc'
alias vibashrc='vi ~/.bashrc'
alias vibashfnc='vi ~/.bashfnc'
alias vivimrc='vi ~/.vimrc'

alias mo='make optimize=0'
alias rpmit='rpm -Uvh'

alias kill1='kill -9 %1'
alias kill2='kill -9 %2'
alias kill3='kill -9 %3'
alias kill4='kill -9 %4'
alias kill5='kill -9 %5'
alias kill6='kill -9 %6'
alias kill7='kill -9 %7'
alias kill8='kill -9 %8'
alias kill9='kill -9 %9'
alias kill10='kill -9 %10'

# -- Ctags 
alias tagit='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'

# -- Make Sane
# This, way, I can just re-source if after I kill an app, it puts me into a bad stty state
stty sane
stty erase ^H
stty erase ^?

export INPUTRC=~/.inputrc
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'



#--------------------------------------------------
# Prompts
#-------------------------------------------------- 
if [ -f ~/bin/git-prompt.sh ]; then
    . ~/bin/git-prompt.sh
    #good: PS1='\[\033[1;30m\]\n\u@\H: \w\[\033[0m\] [\t $?]\[\033[32m\]$(__git_ps1)\[\033[0m\]\n$ '

    PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

    __prompt_command() {
        local EXIT="$?"             # This needs to be first
        PS1=""

        local Clear='\e[0m'
        local Grey='\[\033[1;30m\]'
        local White='\e[0;37m'
        local Red='\[\e[0;31m\]'
        local Green='\[\e[0;32m\]'
        local BYel='\[\e[1;33m\]'
        local BBlu='\[\e[1;34m\]'
        local Purple='\[\e[0;35m\]'
        local bakred='\e[41m'   # RedBackground
        local undpur='\e[4;35m'

        local UserHost="${Grey}\u${Grey}@${Grey}\h"
        local Pwd='\w'
        local Time='\t'
        local BgJobCount='\j'

        if [ $EXIT != 0 ]; then
            ExitCode="${undpur}${EXIT}${White}"      # Add red if exit code non 0
        else
            ExitCode="${White}${EXIT}"
        fi

        PS1+="\n${Grey}$UserHost: $Pwd${White} [${Time} ${ExitCode},${BgJobCount}]${Green}$(__git_ps1)${White}\n"
        PS1+="$ "
    }
fi

