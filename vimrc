" /*Vundle Stuff */

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"   /*Plugins*/  

Plugin 'Yggdroot/indentLine'                " IndentLine (Draws Indent Lines)
Plugin 'itchyny/lightline.vim'              " Lightline
Plugin 'matze/vim-move'                     " Move (A+j, A+k moves selection)
Plugin 'klen/python-mode'                   " Python Mode (:help pymode)
Plugin 'kien/rainbow_parentheses.vim'        " Rainbow Parentheses
Plugin 'altercation/vim-colors-solarized'   " Solarized Colors (Colorscheme)
Plugin 'tpope/vim-surround'                 " Surround.vim (Make Surroundings)
Plugin 'scrooloose/syntastic'               " Syntastic
Plugin 'terryma/vim-multiple-cursors'       " Vim Multiple Cursors
Plugin 'gmarik/Vundle.vim'                  " Vundle
" Plugin 'Valloric/YouCompleteMe'           " You Complete Me (Completion Engine)
Plugin 'honza/vim-snippets'                 " Vim snipmate, dependencies, and snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'airblade/vim-gitgutter'             " Gitgutter



filetype plugin indent on

"   /* Plugin Settings */

"   ~ Indent Line ~
let g:indentLine_color_term = 239   " Set colors for Indent Lines
let g:indentLine_char = '┆'         " Sets Line to ┆
let g:indentLine_enabled = 1        " Auto Enables Indent Lines

"   ~ Python Mode ~
let g:pymode_rope_goto_definition_bind = "<C-]>"    " Override go-to.definition key shortcut to Ctrl-]
let g:pymode_run_bind = "<C-S-e>"                   " Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_doc_bind = "<C-S-d>"                   " Override view python doc key shortcut to Ctrl-Shift-d 

"   ~ Syntastic  ~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" /*End Vundle Calls*/

call vundle#end()

" /*Vim Settings*/

" SET COLORS TO SOLARIZED
syntax enable
set background=dark
colorscheme solarized

" TURN ON RELATIVE LINE NUMBERS AND NO TEXT WRAP
set number		    " Enable Line Numbers
set relativenumber	" And Relative Numbers
" set nowrap		    " And Disable Text Wrapping
 
" SET TAB WIDTH AND INDENT
set tabstop=4	    	" The width of a TAB is set to 4
         		    	" Still it is a \t. It is just that
 		            	" Vim will interpret it to be having
 		    	        " a width of 4
set shiftwidth=4  	" Indents will have a width of 4
set softtabstop=4 	" Sets the number of columns for a TAB
set expandtab     	" Expands TABs to spaces
set smartindent   	" Enable Smart Indent

" LIGHTLINE
syntax enable
let g:lightline = {
    \ 'colorscheme': 'solarized_dark',
    \ }
set laststatus=2

" RAINBOW PARENTHESES
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
