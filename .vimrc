" Make vim more useful
call pathogen#infect()

set nocompatible

" ===========================================================================================
"  Set up Vundle https://github.com/gmarik/vundle
" ===========================================================================================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" ===========================================================================================
"  Initialize Vundle Bundles
" ===========================================================================================

" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'

" Fancy snippet machine
" Bundle 'SirVer/ultisnips'

" Vmustache template engine, prerequisite for PDV
Bundle 'tobyS/vmustache'

" PHP Documentor for VIM
Bundle 'tobyS/pdv'

" Nerd Tree
Bundle 'scrooloose/nerdtree'

" Interactive Replace
Bundle 'hwrod/interactivereplace'

" Super Tab
Bundle 'ervandew/supertab'

" Syntax checking
Bundle 'scrooloose/syntastic'

" Tab visual display
Bundle 'Yggdroot/indentLine'

" Auto highlight matching words
Bundle 'qstrahl/vim-matchmaker'

" Auto resize vertical splits
Bundle 'mattboehm/vim-accordion'

" Auto completion for PHP
Bundle 'shawncplus/phpcomplete.vim'

" Improved statusbar
Bundle 'bling/vim-airline'
Bundle 'paranoida/vim-airlineish'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'itchyny/calendar.vim'

Bundle 'wakatime/vim-wakatime'

" ===========================================================================================
"  Disable some default settings
" ===========================================================================================
" Delete all auto commands (needed to auto source .vimrc after saving)
:autocmd!
au BufRead,BufNewFile *.php set indentexpr= " Disable phpsyntax based indenting for .php files

" ===========================================================================================
"  Base Config
" ===========================================================================================
set backupdir=$HOME/bu/temp/bus         " Backups are written here if possible.
set directory=$HOME/bu/temp/swap        " Swap files are written here if possible.
set autoread                            " Read files when they've been changed outside of Vim.
set autowrite
set fileformats+=mac
:au FocusLost * :wa                     " Save the document when the window loses focus
nnoremap ; :
filetype plugin indent on           " Use filetype plugins, e.g. for PHP
set hidden
set ttyfast
set viminfo^=!
" set ofu=syntaxcomplete#Complete
set modeline                            " Allow file inline modelines to provide settings

" ===========================================================================================
"  Remapping
" ===========================================================================================
let mapleader=','                       " Change mapleader
let maplocalleader=','
inoremap jj<ESC>                        " exit to normal mode with 'jj'
nmap <F1> <ESC>                         " Map F1 to Esc instead of the stupid help crap.
inoremap <F1> <ESC>                     " -
nnoremap <F1> <ESC>                     " -
vnoremap <F1> <ESC>                     " -
nnoremap ' `                            " -
nnoremap ` '                            " -
nnoremap <C-e> 3<C-e>                   " -
nnoremap <C-y> 3<C-y>                   " -
inoremap <Left> <nop>                   " For learning vi
inoremap <Right> <nop>                  " -
inoremap <Up> <nop>                     " -
inoremap <Down> <nop>                   " -
nnoremap <Left> <nop>                   " For learning vi
nnoremap <Right> <nop>                  " -
nnoremap <Up> <nop>                     " -
nnoremap <Down> <nop>                   " -
nnoremap j gj
nnoremap k gk
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap Y y$
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>      " Opens ~/.vimrc in a new vertically split window
nnoremap <leader>tc :tabc<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap K :call investigate#Investigate()
nnoremap <leader>gr :!grep -rl --include=*.php "<C-R><C-W>" *<cr>
nnoremap <leader>gl :!grep -r --color --include=*.php "<C-R><C-W>" *<cr>

" ===========================================================================================
"  Configure Syntastic Settings
" ===========================================================================================
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_style_error_symbol = 'E-'
let g:syntastic_style_warning_symbol = 'W-'
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 2
noremap <leader>n :lnext<CR>
noremap <leader>p :lprev<CR>

" ===========================================================================================
"  Configure Ultisnips
" ===========================================================================================
" let g:UltiSnipsExpandTrigger = "<Tab>"
" let g:UltiSnipsJumpForwardTrigger = "<Tab>"
" let g:UltiSnipsListSnippets = "<M-Tab>"
" Set a custom snippets directory
" let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets/"
" let g:UltiSnipsSnippetDirectories = ["snippets"]

" ===========================================================================================
"  Setup undo functionality
" ===========================================================================================
if exists('+undofile')
    set undofile
endif
if exists("&undodir")                                           " -
    set undodir=C:\Users\joseph.thayne\Documents\bu\temp\undo   " Undo files are written here if possible.
endif                                                           " -
set undolevels=1000                                             " Number of levels of undo

" ===========================================================================================
"  Indentation
" ===========================================================================================
set autoindent      " Automatically indent new lines
set smartindent     " -
set smarttab        " -
set expandtab       " -
set shiftwidth=4    " -
set softtabstop=4   " -
set tabstop=4       " Make tabs 4 spaces wide

" ===========================================================================================
"  Set paste mode
" ===========================================================================================
set pastetoggle=<ins>
nnoremap <silent> <ins> :setlocal paste!<CR>i
autocmd InsertLeave <buffer> se nopaste

" ===========================================================================================
"  Text Formatting
" ===========================================================================================
if has('syntax')
    syntax enable
endif
set wrap            " Wrap lines
set cursorline      " Highlight current line

" ===========================================================================================
"  Color Scheme
" ===========================================================================================
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set t_Co=256

" ===========================================================================================
"  Line indentation settings
" ===========================================================================================
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

" ===========================================================================================
"  UI
" ===========================================================================================
set title                                   " Show the filename in the window titlebar
set ruler                                   " Show the cursor position
set showcmd                                 " Don not display incomplete commands
set number                                  " Enable line numbers
set numberwidth=4                           " Width of line number column
if exists("&relativenumber")                " Use relative line numbers
    " set relativenumber                      " -
    au BufReadPost * set relativenumber     " -
endif                                       " -
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set ch=2
set nostartofline                           " Avoid moving cursor to BOL when jumping around
set whichwrap=b,s,h,l,<,>                   " <BS> <Space> h l <Left> <Right> can change lines
set backspace=start,eol,indent              " allow backspacing over anything when in insert mode
set shortmess=atI                           " shorten messages
set report=0                                " : commands always print changed line count.
set history=1000                            " Number of command lines stored in the history tables.
set encoding=utf-8 nobomb                   " Use UTF-8 without BOM
set showmode                                " Show the current mode
set winaltkeys=no                           " -
set scrolloff=3                             " Keep 3 context lines above and below the cursor
set sidescrolloff=5
set guifont=Anonymous_Pro:h7:cANSI               " Use this font
set guicursor=a:blinkon0                    " Use this font
autocmd InsertLeave * se nocul              " Remove line highlight when leaving insert mode
autocmd InsertEnter * se cul                " Highlight current line in insert mode.
set display+=lastline
set virtualedit=onemore                     " Cursor goes beyond last character

" Source .vimrc after saving .vimrc
if has('autocmd')
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ===========================================================================================
" Autocompletion
" ===========================================================================================
set wildmenu                            " Enhance command-line completion
set wildmode=list:longest,full          " -
set wildignore=.svn/*
set wildignore+=*.png,*.jpg,*.gif

" ===========================================================================================
" Visual Cues
" ===========================================================================================
set gdefault                                                " Applies substitutions globally on lines by default
set incsearch                                               " Incrementally search while typing a /regex
set hlsearch                                                " Highlight searches by default.
set ignorecase                                              " Default to using case insensitive searches,
set smartcase                                               " unless uppercase letters are used in the regex.
set vb t_vb=                                                " Disable all bells.
set visualbell                                              " -
nnoremap <leader><Space> :noh<CR>                           " Pressing the spacebar clears search highlighting
if maparg('<Space>', 'n') ==# ''
    nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>     " Pressing the spacebar clears search highlighting
endif

" set list
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
nnoremap <leader>l :set list!<CR>
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ============================================================================
"  Set status bar options
" ============================================================================
set laststatus=2                                            " Always show statusline, even if only 1 window.
set statusline=%<%f\
set statusline+=%w%h%m%r
" set statusline+=%{fugitive#statusline()}
set statusline+=\ [%{&ff}/%Y]
set statusline+=\ [%{getcwd()}]
set statusline+=\ [%{getcwd()}]

" ============================================================================
"  Set folding options
" ============================================================================
map <leader>f :set foldmethod=indent<CR>zM<CR>      " Fold all
map <leader>F :set foldmethod=manual<CR>zR<CR>      " Unfold all

" ===========================================================================================
" Set window navigation
" ===========================================================================================
set splitright
set splitbelow

" ===========================================================================================
" Strip all trailing whitespace in file
" ===========================================================================================
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" ===========================================================================================
" PHP Documentor Formatting
" ===========================================================================================
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" inoremap <ESC><C-p> :call pdv#DocumentWithSnip()<CR>i
" nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
" vnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
inoremap <ESC><C-p> :call pdv#DocumentCurrentLine()<CR>i
nnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>
vnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>

" ===========================================================================================
" Highlight characters that are over the mximum length in a line
" ===========================================================================================
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%151v.\+/

" ===========================================================================================
" File Browsing
" ===========================================================================================
set suffixesadd+=.php                       " Add .php to the list of extensions to look under for gf

" ===========================================================================================
" File Browsing
" ===========================================================================================
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" ===========================================================================================
" File Browsing
" ===========================================================================================
autocmd vimenter * Matchmaker

" ===========================================================================================
" Vim Accordion
" ===========================================================================================
autocmd vimenter * AccordionAll 3

"Set shortcuts for most frequently used commands
nnoremap <C-w>2 :Accordion 2<CR>
nnoremap <C-w>3 :Accordion 3<CR>
nnoremap <C-w>0 :AccordionStop<CR>

"More shortcuts, without a good available <C-w> option
nnoremap <leader>d :AccordionDiff<CR>
nnoremap <leader>i :AccordionZoomIn<CR>
nnoremap <leader>o :AccordionZoomOut<CR>

" ===========================================================================================
" Supertabs
" ===========================================================================================
let g:SuperTabDefaultCompletionType = ""

let g:airline_theme = 'airlineish'

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ===========================================================================================
" Highlight words to avoid in tech writing
" =======================================
"
" obviously, basically, simply, of course, clearly,
" just, everyone knows, However, So, easy

" http://css-tricks.com/words-avoid-educational-writing/
" ===========================================================================================
highlight TechWordsToAvoid ctermbg=red ctermfg=white

function! MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

autocmd FileType php call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
