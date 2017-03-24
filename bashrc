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
export PATH=$PATH:/home/chp/nic_repos/chip_test/scripts/ # run things like 'snap -- trivial'
alias sudop='sudo env "PATH=$PATH"' # sudo retaining original user's path

# Terminal title
##################################################
PROMPT_COMMAND='echo -ne "\033]0;$(hostname)\007"' # terminal title = hostname

# Mercurial bookmark
##################################################
function hg_bookmark
{
    hg_bookmark=$(hg bookmarks 2> /dev/null | grep "^ \*" | sed 's/^ \* //g' | sed 's/ *[0-9]:[0-9a-e]*$//g')
    hg_bookmark="[$hg_bookmark]"
}

# Prompt!
##################################################
#https://www.reddit.com/r/linux/comments/2uf5uu/this_is_my_bash_prompt_which_is_your_favorite/
## Colors?  Used for the prompt.
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

PROMPT_COMMAND=prompt_command

function prompt_command
{
    hg_bookmark    
    smile_prompt
}

function smile_prompt
{
if [ "$?" -eq "0" ]
then
#smiley
#SC="${GREEN}:)"
SC=""
else
#frowney
SC=" ${RED}:("
fi
if [ $UID -eq 0 ]
then
#root user color
UC="${RED}"
else
#normal user color
UC="${BMAGENTA}"
fi
#hostname color
HC="${BMAGENTA}"
#regular color
RC="${BWHITE}"
#default color
DF='\[\e[0m\]'
PS1="[${UC}\u${RC}${BBLACK}@${HC}\h ${RC}\W${DF}]$hg_bookmark${SC}${DF} "
}

# /.bashrc

