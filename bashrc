#2345678901234567890123456789012345678901234567890123456789012345678901234567890
################################################################################
# .bashrc
# Charlie Palmer
################################################################################

# Colouring command line things
##################################################
alias grep='grep --color=auto'
alias la='ls -lah --color=tty'
alias ll='ls -lh --color=tty'
alias ls='ls --color=tty'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# Solarflare stuff
##################################################
export PATH=$PATH:/home/chp/nic_repos/chip_test/scripts/ # needed to have correct mmaketool in path when running make for snapper
alias snap-m1='sudo EF_USERBUILD=medford1 /home/chp/nic_repos/chip_test/scripts/snap'
alias snap-m2='sudo EF_USERBUILD=medford2 /home/chp/nic_repos/chip_test/scripts/snap'
alias esnap-m2='/home/chp/nic_repos/chip_test/src/tools/cosim/esnap --chip medford2 --farmi-lite --dutcfg min --runtime mcfw_cosim_eftest_medford2 --init'

# Terminal title
##################################################
#PROMPT_COMMAND='echo -ne "\033]0;$(hostname)\007"' # terminal title = hostname
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Prompt!
##################################################
# Colors
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

# PROMPT_COMMAND is run every line
PROMPT_COMMAND=prompt_command

function prompt_command
{
  local EXIT="$?"
  local DF='\[\e[0m\]'

  base_prompt
  hg_prompt
  smile_prompt $EXIT
  prompt_symbol
  PS1=$PS1${DF}" "
  echo -ne "\033]0;$(hostname)\007" # terminal title = hostname
}

function prompt_symbol
{
if [ $UID -eq 0 ]; then
  #root
  PS1+=#
else
  #normal user
  PS1+=$
fi
}

function base_prompt
{
if [ $UID -eq 0 ]; then
  #root user color
  local UC="${RED}"
else
  #normal user color
  local UC="${BMAGENTA}"
fi
#hostname color
local HC="${BMAGENTA}"
#regular color
local RC="${BWHITE}"
#default color
local DF='\[\e[0m\]'
#PS1="[${UC}\u${RC}${BBLACK}@${HC}\h ${RC}\W${DF}]${DF}"
PS1="[${HC}\h${BBLACK}:${RC}\W${DF}]"
}

function smile_prompt
{
local DF='\[\e[0m\]'
if [[ $1 != 0 ]]; then
    PS1+=${RED}":("${DF}
#else
#    PS1+=":)"
fi
}

function hg_prompt
{
local DF='\[\e[0m\]'
local branch=$(hg branch 2> /dev/null)
local bookmark=$(hg bookmarks 2> /dev/null | grep "^ \*" | sed 's/^ \* //g' | sed 's/ *[0-9]*:[0-9a-z]*$//g')
if [ -n "$branch" ]; then
    PS1+="[${BBLUE}$branch${BBLACK}:${BWHITE}$bookmark${DF}]\n"
fi
}

# /.bashrc

