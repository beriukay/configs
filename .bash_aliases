# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#cd up faster
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

alias c='printf "\033c"'
alias enc='encfs -i 5 ~/.junk ~/junk'
alias q='exit'

#alias pushpull="git push && ssh test@192.168.1.119 'cd LinuxTest && git pull'"
alias rigrep="grep -ri"
alias breaktime="termdown 15m -T BREAK -s"
alias lunchbreak="termdown 30m -T 'OUT TO LUNCH' -s"
alias dostest="vim -p AUTOEXEC.BAT VLTEST/PRETEST.BAS VLTEST/VLTEST.FRM"
alias bc="bc -lq"
alias grip="grep -riIn"
alias sb="ssh sandbox"
alias python3="python3 -q"
