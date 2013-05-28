alias addalias='nano ~/.dotfiles/bash/bash_aliases'
alias subl='"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"'

# Start an HTTP server from a directory
alias pserver='python -m SimpleHTTPServer'

# bash_aliases

# Allow aliases to be with sudo
alias sudo="sudo "
alias please="sudo "
alias !!!="sudo !!"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

# Git
# alias g="git "
alias ga='git add'
alias gc='git commit'
alias gco="git checkout"
alias gs="git status"

# ZSH
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Open any files marked as “modified” in your default editor.
alias changed='open `git status --porcelain | sed -ne "s/^ M //p"`'

# List dir contents aliases

# Long form no user group, color
alias l="ls -oG"
alias ll="ls -laoG"

# Order by last modified, long form no user group, color
alias lt="ls -toG"
# List all except . and ..., color, mark file types, long form no user group, file size
alias la="ls -AGFoh"
# List all except . and ..., color, mark file types, long form no use group, order by last modified, file size
alias lat="ls -AGFoth"

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"

# `cat` with beautiful colors. requires Pygments installed.
#  sudo easy_install Pygments
alias c="pygmentize -O style=solarized -f console256 -g"

# YSlow
alias yslow="phantomjs ~/.dotfiles/scripts/yslow.js --disk-cache=false --info basic --format plain"

# IP addresses
alias ip='IP=`dig +short myip.opendns.com @resolver1.opendns.com`; growlnotify -s -a terminal -t "IP Address" -m "${IP}"'
alias lip='IP=`ipconfig getifaddr en0`; growlnotify -s -a terminal -t "Local IP" -m "${IP}"'

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"