# It contains bash aliases
#!/bin/bash

# ============================================
# ULTIMATE BASH ALIASES COLLECTION
# ============================================
# Save this file as ~/.bash_aliases
# Make sure your ~/.bashrc includes: if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
# ============================================

# ============================================
# 1. SYSTEM INFORMATION & NAVIGATION
# ============================================

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias home='cd ~'

# Directory listing with various options
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lah'
alias lt='ls -ltr'
alias l.='ls -d .*'
alias lr='ls -lR'
alias lss='ls -lhS'  # Sort by size
alias lst='ls -lht'   # Sort by time
alias lsg='ls -l | grep'  # Search in ls output

# Tree view (if tree command is installed)
alias tree='tree -C'
alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias treed='tree -d'  # Directories only

# Disk usage
alias du='du -h'
alias dus='du -sh'
alias duf='du -sh * | sort -h'
alias dud='du -sh */'  # Size of directories
alias du1='du -h --max-depth=1'
alias du10='du -h --max-depth=1 | sort -hr | head -10'

# Disk free
alias df='df -h'
alias dfi='df -hi'
alias dft='df -T'  # Include filesystem type

# System info
alias sysinfo='uname -a'
alias kernel='uname -r'
alias os='cat /etc/os-release'
alias distro='lsb_release -a 2>/dev/null || cat /etc/*release'
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias diskinfo='sudo fdisk -l'
alias pciinfo='lspci'
alias usbinfo='lsusb'
alias netinfo='ip addr show'

# ============================================
# 2. FILE & DIRECTORY OPERATIONS
# ============================================

# File operations
alias mkdir='mkdir -pv'  # Create parent directories and verbose
alias rmdir='rmdir -v'
alias rm='rm -i'  # Interactive by default
alias cp='cp -iv'  # Interactive and verbose
alias mv='mv -iv'  # Interactive and verbose
alias ln='ln -v'
alias touch='touch -c'  # Don't create file if doesn't exist

# Safe operations
alias rmf='rm -rf'  # Force remove (use with caution!)
alias cpf='cp -rf'  # Force copy
alias mvf='mv -f'   # Force move
alias rmrf='rm -rf'

# File permissions
alias perm='stat -c "%a %n"'  # Show permissions in octal
alias perm755='chmod 755'
alias perm644='chmod 644'
alias perm600='chmod 600'
alias perm700='chmod 700'

# File searching
alias ff='find . -type f -name'  # Find file by name
alias fd='find . -type d -name'  # Find directory by name
alias ffs='find . -type f -name "*$1*"'  # Find file containing text
alias ftext='grep -rnw . -e'  # Search text in files

# Batch operations
alias backup='cp -v $1 $1.bak'
alias backupdir='cp -rv $1 $1.bak'
alias cleanup='find . -name "*~" -delete'  # Remove backup files

# ============================================
# 3. PROCESS MANAGEMENT
# ============================================

# Process listing
alias psg='ps aux | grep -v grep | grep -i'  # Grep processes
alias psm='ps aux | sort -nrk 3 | head -20'  # Top memory processes
alias psc='ps aux | sort -nrk 3 | head -20'  # Top CPU processes
alias pstree='pstree -p'  # Process tree with PIDs

# Kill processes
alias k='kill'
alias k9='kill -9'
alias killall='killall -v'  # Verbose killall
alias pkill='pkill -f'  # Kill by full command name

# Job control
alias jobs='jobs -l'  # Show job IDs
alias fg='fg %'
alias bg='bg %'

# Process monitoring
alias top='top -c'  # Show full command lines
alias htop='htop'
alias glances='glances'
alias watch='watch -n 1'  # Watch command every second

# ============================================
# 4. NETWORKING & INTERNET
# ============================================

# Network connections
alias netstat='netstat -tulpn'  # Listening ports
alias ss='ss -tulpn'  # Modern netstat
alias ports='netstat -tulanp'
alias myip='curl -s ifconfig.me'
alias localip='ip addr show | grep inet | grep -v inet6'
alias publicip='curl -s ipinfo.io/ip'
alias ipinfo='curl -s ipinfo.io'

# DNS and connectivity
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias pingg='ping -c 5 8.8.8.8'
alias dns='dig +short'
alias nslookup='nslookup'
alias traceroute='traceroute -I'  # Use ICMP

# Download tools
alias wget='wget -c'  # Continue partial downloads
alias get='wget -c'
alias getfile='wget --limit-rate=200k'
alias curl='curl -L'  # Follow redirects

# Network monitoring
alias bw='nethogs'  # Bandwidth monitoring
alias netload='iftop'
alias sniffer='sudo tcpdump -i any'
alias sniff='sudo tcpdump -i any -n -v'

# SSH
alias ssh='ssh -X'  # Enable X11 forwarding
alias sshkey='cat ~/.ssh/id_rsa.pub'  # Show public key
alias sshcopy='cat ~/.ssh/id_rsa.pub | pbcopy'  # Copy to clipboard (macOS)
alias sshcopyx='xclip -sel clip < ~/.ssh/id_rsa.pub'  # Copy to clipboard (Linux)

# ============================================
# 5. SYSTEM ADMINISTRATION
# ============================================

# Package management (Debian/Ubuntu)
alias update='sudo apt update && sudo apt upgrade -y'
alias upgrade='sudo apt upgrade -y'
alias install='sudo apt install -y'
alias remove='sudo apt remove -y'
alias purge='sudo apt purge -y'
alias autoremove='sudo apt autoremove -y'
alias search='apt search'
alias show='apt show'

# Package management (RHEL/CentOS/Fedora)
alias yupdate='sudo yum update -y'
alias yinstall='sudo yum install -y'
alias yremove='sudo yum remove -y'
alias ysearch='yum search'

# Service management (systemd)
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
alias daemon='sudo systemctl daemon-reload'
alias listunits='systemctl list-units --all'
alias listfailed='systemctl --failed'

# Log viewing
alias logs='sudo journalctl -f'  # Follow logs
alias logse='sudo journalctl -xe'  # Extended logs
alias dmesg='dmesg -T'  # Human readable timestamps
alias dmesgw='dmesg -w'  # Watch dmesg

# User management
alias users='cut -d: -f1 /etc/passwd'
alias groups='cut -d: -f1 /etc/group'
alias lastlog='lastlog | grep -v "Never logged"'
alias who='who -H'

# ============================================
# 6. DEVELOPMENT TOOLS
# ============================================

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdD='git branch -D'
alias gm='git merge'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --oneline --graph --decorate --all'
alias gdiff='git diff'
alias gstash='git stash'
alias gstashp='git stash pop'
alias gstashl='git stash list'
alias greset='git reset --hard'
alias gclean='git clean -fd'
alias gtag='git tag'
alias gignore='git update-index --assume-unchanged'  # Ignore file changes

# Docker aliases
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dr='docker run'
alias drm='docker rm'
alias drmi='docker rmi'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias drestart='docker restart'
alias dbuild='docker build -t'
alias dcompose='docker-compose'

# Kubernetes aliases
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kl='kubectl logs -f'
alias kexec='kubectl exec -it'
alias kapply='kubectl apply -f'

# Python
alias py='python3'
alias ipy='ipython'
alias pip='pip3'
alias pipi='pip install'
alias pipu='pip install --upgrade'
alias pipr='pip install -r requirements.txt'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node.js
alias npmg='npm install -g'
alias npr='npm run'
alias npi='npm install'
alias npis='npm install --save'
alias npisd='npm install --save-dev'

# ============================================
# 7. TEXT PROCESSING & EDITING
# ============================================

# Editors
alias v='vim'
alias vi='vim'
alias n='nano'
alias nano='nano -w'  # Disable word wrap
alias s='subl'  # Sublime Text
alias c='code'  # VS Code

# File viewing
alias h='head -20'
alias t='tail -20'
alias tf='tail -f'
alias less='less -R'  # Preserve colors

# Text searching
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias find='find -L'  # Follow symlinks

# Text manipulation
alias count='wc -l'
alias sortu='sort | uniq -c | sort -rn'  # Count unique
alias dedup='sort -u'  # Remove duplicates

# ============================================
# 8. COMPRESSION & ARCHIVING
# ============================================

alias targz='tar -czvf'
alias tarxz='tar -cJvf'
alias untar='tar -xzvf'
alias untarxz='tar -xJvf'
alias zipf='zip -r'
alias unzipf='unzip'
alias extract='extract'  # Function defined below

# Extract function (add to .bashrc)
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ============================================
# 9. DATE & TIME
# ============================================

alias now='date +"%Y-%m-%d %H:%M:%S"'
alias today='date +"%Y-%m-%d"'
alias timestamp='date +%s'
alias calendar='cal -3'  # Show 3 months
alias week='date +%V'  # Week number

# ============================================
# 10. SAFETY & CONVENIENCE
# ============================================

# Safety
alias mkcd='mkcd'  # Function defined below
alias sl='ls'  # In case of typo
alias fuck='sudo $(history -p \!\!)'  # Run last command with sudo

# Clipboard integration (Linux)
if command -v xclip &> /dev/null; then
    alias copy='xclip -selection clipboard'
    alias paste='xclip -selection clipboard -o'
fi

# Clipboard integration (macOS)
if command -v pbcopy &> /dev/null; then
    alias copy='pbcopy'
    alias paste='pbpaste'
fi

# Mkcd function (create directory and cd into it)
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ============================================
# 11. CUSTOM PROMPTS & FUNCTIONS
# ============================================

# Weather
alias weather='curl -s wttr.in'
alias weatherc='curl -s wttr.in?0'  # Compact weather

# Calculator
alias calc='bc -l'

# Quick webserver
alias serve='python3 -m http.server'
alias serve8000='python3 -m http.server 8000'
alias serve8080='python3 -m http.server 8080'

# Speed test
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# Quick notes
alias notes='vim ~/.notes.txt'
alias noteslist='cat ~/.notes.txt'
alias note='echo "$(date): $1" >> ~/.notes.txt'

# Todo list
alias todo='vim ~/.todo.txt'
alias todolist='cat ~/.todo.txt'

# ============================================
# 12. SECURITY
# ============================================

# Hash functions
alias md5='md5sum'
alias sha1='sha1sum'
alias sha256='sha256sum'
alias sha512='sha512sum'

# SSL certificate check
alias sslcheck='openssl s_client -connect'
alias sslcheckcert='echo | openssl s_client -servername'

# File permissions check
alias checkperms='find . -perm -o+w -type f -ls'  # World-writable files

# ============================================
# 13. NETWORK SERVICES
# ============================================

# Check if port is open
alias portcheck='nc -zv localhost'
alias listenports='sudo lsof -i -P -n | grep LISTEN'

# Check website headers
alias headers='curl -I'
alias response='curl -I -s'

# ============================================
# 14. PERFORMANCE MONITORING
# ============================================

alias memwatch='watch -n 2 free -h'
alias cpuwatch='watch -n 2 "ps aux | sort -nrk 3 | head -10"'
alias diskwatch='watch -n 2 df -h'
alias networkwatch='watch -n 2 "netstat -i | grep -v Kernel"'

# ============================================
# 15. MISC UTILITIES
# ============================================

# Reboot/Shutdown
alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'
alias halt='sudo systemctl halt'
alias suspend='sudo systemctl suspend'

# Clear screen
alias c='clear'
alias cls='clear'

# Path
alias path='echo $PATH | tr ":" "\n"'
alias libpath='echo $LD_LIBRARY_PATH | tr ":" "\n"'

# History
alias h='history'
alias hg='history | grep'

# Reload shell
alias reload='source ~/.bashrc'
alias refresh='source ~/.bashrc'

# ============================================
# 16. ALIASES FOR COMMON COMMANDS
# ============================================

# Common typos
alias gti='git'
alias got='git'
alias get='git'
alias mkae='make'
alias exot='exit'

# Quick edits
alias aliasrc='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias profile='vim ~/.profile'
alias hostfile='sudo vim /etc/hosts'
alias crontab='crontab -e'

# Quick reload
alias reloadaliases='source ~/.bash_aliases'

# ============================================
# 17. EMOJI & FUN STUFF
# ============================================

# Emoji shortcuts (if supported)
alias shrug='echo "¯\_(ツ)_/¯"'
alias tableflip='echo "(╯°□°）╯︵ ┻━┻"'
alias smile='echo "😊"'
alias success='echo "✅"'
alias error='echo "❌"'
alias warning='echo "⚠️"'

# ============================================
# 18. AWS & CLOUD (Optional)
# ============================================

# AWS CLI aliases (if using AWS)
# alias awslist='aws s3 ls'
# alias awssync='aws s3 sync'
# alias awsprofile='export AWS_PROFILE='

# ============================================
# 19. DATABASE
# ============================================

# MySQL
alias mysqlstart='sudo systemctl start mysql'
alias mysqlstop='sudo systemctl stop mysql'
alias mysqlstatus='sudo systemctl status mysql'
alias mysqlcli='mysql -u root -p'

# PostgreSQL
alias pgstart='sudo systemctl start postgresql'
alias pgstop='sudo systemctl stop postgresql'
alias pgstatus='sudo systemctl status postgresql'
alias pgcli='sudo -u postgres psql'

# ============================================
# 20. CUSTOM ALIASES FOR YOUR WORKFLOW
# ============================================

# Add your own custom aliases here
# Example:
# alias work='cd ~/projects/work'
# alias personal='cd ~/projects/personal'
# alias research='cd ~/research'

# ============================================
# END OF ALIASES
# ============================================

# Print message when loaded
echo -e "\033[0;32m✓ Bash aliases loaded successfully\033[0m"
