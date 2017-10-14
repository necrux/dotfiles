# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export HISTFILESIZE=500000
export HISTTIMEFORMAT='%F %T '

# User specific aliases and functions
alias cb="xsel --clipboard < $1"

# My VPNs
alias work='/opt/cisco/anyconnect/bin/vpn connect __VPN__'
alias disconnect='/opt/cisco/anyconnect/bin/vpn disconnect'
alias home='sudo openvpn --config client.ovpn --auth-nocache'

#Custom Variables
export SSO=__SSO__

#SSH Connections
alias dfw='ssh -F ~/.ssh/dfw.config pbast' 
alias ord='ssh -F ~/.ssh/ord.config pbast' 
alias iad='ssh -F ~/.ssh/iad.config pbast' 
alias lon3='ssh -F ~/.ssh/lon3.config pbast' 
alias lon5='ssh -F ~/.ssh/lon5.config pbast' 
alias hkg='ssh -F ~/.ssh/hkg.config pbast' 
alias syd='ssh -F ~/.ssh/syd.config pbast' 

alias pdfw="ssh -F ~/.ssh/dfw.config $1"
alias pord="ssh -F ~/.ssh/ord.config $1"
alias piad="ssh -F ~/.ssh/iad.config $1"
alias plon3="ssh -F ~/.ssh/lon3.config $1"
alias plon5="ssh -F ~/.ssh/lon5.config $1"
alias phkg="ssh -F ~/.ssh/hkg.config $1"
alias psyd="ssh -F ~/.ssh/syd.config $1"

source ~/.ps1

## FAWS ##
export PATH=$PATH:~/bin/faws-linux:~/bin/faws

#Function to search shitty PasswordSafe site.
function psafe {
  /opt/google/chrome/google-chrome "https://passwordsafe.corp.rackspace.com/projects/search?utf8=&project_query=$1"
}

#Function to launch ScaleFT instance.
function sf {
  DFW=pbast.dfw1.corp.rackspace.net
  sft ssh $1 --via ${SSO}@${DFW} --via $2
}
