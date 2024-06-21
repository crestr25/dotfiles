#!/bin/sh


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Git
alias ga='git add'
alias gc="git commit -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias gdiff="git diff"
alias gco="git checkout"
alias gcb='git checkout -b'

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
