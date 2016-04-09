" /*Vundle Stuff */

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"   /*Plugins*/  

Plugin 'Yggdroot/indentLine'                " IndentLine (Draws Indent Lines)
Plugin 'bling/vim-airline'                " Airline
" Plugin 'itchyny/lightline.vim'              " Lightline
Plugin 'scrooloose/nerdtree'                " Nerd Tree
Plugin 'ap/vim-css-color'                   " Vim CSS Color
Plugin 'kien/ctrlp.vim'                     " Ctrl-P Fuzzy search
Plugin 'matze/vim-move'                     " Move (A+j, A+k moves selection)
Plugin 'klen/python-mode'                   " Python Mode (:help pymode)
Plugin 'kien/rainbow_parentheses.vim'       " Rainbow Parentheses
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

" AIRLINE
let g:airlineToggledOn = 1
set laststatus=2

" LIGHTLINE
"let g:lightline = {
"    \ 'colorscheme': 'wombat',
"    \ }

" /*End Vundle Calls*/

call vundle#end()

" /*Vim Settings*/

set laststatus=2

" Set Syntax Highlighting
syntax enable 

" SHOW TITLE
set title

" SET COLORS TO SOLARIZED
" set background=dark
" colorscheme solarized

" SET COLORS TO GOTHAM
" colorscheme gotham256

" VISUAL NICENESS
set number          " Enable Line Numbers
set relativenumber  " And Relative Numbers
" set nowrap        " And Disable Text Wrapping
set cursorline
set lazyredraw
set showmatch
set hlsearch

" FOLDING
set foldenable        " Enable folding
set foldlevelstart=0  " open most folds by default
set foldnestmax=10
set foldmethod=indent
 
" SET TAB WIDTH AND INDENT
set tabstop=2           " The width of a TAB is set to 2
                        " Still it is a \t. It is just that
                        " Vim will interpret it to be having
                        " a width of 4
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expands TABs to spaces
set smartindent     " Enable Smart Indent

function TabToggle4()
  set ts=2 
  set sts=2 
  set noet
  retab!
  set ts=4 
  set sts=4 
  set et
  retab
  set expandtab
endfunction

function TabToggle2()
  set ts=4 
  set sts=4 
  set noet
  retab!
  set ts=2 
  set sts=2 
  set et
  retab
  set expandtab
endfunction

nmap \t :call TabToggle4()<CR>
nmap \r :call TabToggle2()<CR>


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
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" KEYBINDINGS

"" Sets j and k to move up and down naturally
"" (DOn't skip wrapped lines)
nmap j gj
nmap k gk

"" Rebinds CTRL-E to return to previous file
"" After opening with :e _file_
"" Equivalent to running :b# or :e#
nmap <C-e> :e#<CR>

"" Binds to cyle to next and previous buffer
nmap \j :bnext<CR>
nmap \k :bprev<CR>
nmap \l :ls<CR>
nmap \x :bd<CR>

"" Binds ; to start searching buffers
nmap ; :CtrlPBuffer<CR>

"" Fold Bindings
noremap <space> za
noremap \a zR
noremap \s zM
noremap \z zr
noremap \x zm

"" Binds \e to toggle Nerd Tree
nmap \e :NERDTreeToggle<CR>

"" Tab bindings
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tr :tabclose<CR>
nnoremap tt :tabnew<CR>

"" Paste toggle
nnoremap \p :set paste!<CR>

"" Split Bindings/Settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" DEFAULTS (USEFUL)
"Max out the height of the current split
"ctrl + w _
"
""Max out the width of the current split
"ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =
""Swap top/bottom or left/right split
"Ctrl+W R
"
"Break out current window into a new tabview
"Ctrl+W T
"
""Close every window in the current tabview but the current one
"Ctrl+W o
