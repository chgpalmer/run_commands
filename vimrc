"2345678901234567890123456789012345678901234567890123456789012345678901234567890
" ##############################################################################
" # .vimrc
" # Charlie Palmer
" ##############################################################################

" # Colorscheme
" ################################################
colorscheme default

" # Line numbering
" ################################################
set number

" # Highlighting
" ################################################
syntax on 		" source code highlighting
set hlsearch		" search highlighting

" # Indentation / tabs
" ################################################
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" # Command Window
" ################################################
set cmdheight=2         " avoids <enter to continue> because of small window
set laststatus=2        " always display status line

" # Search
" ################################################
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" #
" ...

" # Other stuff
" ################################################
set visualbell          " visual cue when doing things wrong
set mouse=a             " enable mouse
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set wildmenu		" better command line completion
set nocompatible	" Use Vim defaults (much better!)
set nostartofline       " tries to go to the same point when moving between
                        "  lines, breaking compatibility with vi but who cares


" # /.vimrc
