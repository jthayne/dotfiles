" Make vim more useful
set nocompatible

" ============================================================================
"  Base Config
" ============================================================================
" runtime macros/matchit.vim
set backupdir=C:\Users\joseph.thayne\Documents\bu\temp\bus      " Backups are written here if possible.
set directory=C:\Users\joseph.thayne\Documents\bu\temp\swap     " Swap files are written here if possible.
if exists("&undodir")                                           " -
    set undodir=C:\Users\joseph.thayne\Documents\bu\temp\undo   " Undo files are written here if possible.
endif                                                           " -
set autoread                                                    " Read files when they've been changed outside of Vim.
:au FocusLost * :wa                                             " Save the document when the window loses focus
nnoremap ; :
filetype on                                                     " -
filetype plugin on                                              " Use filetype plugins, e.g. for PHP
filetype indent on
if version >= 730                                               " persistent undo (vim 7.3+)
    set undofile
endif
set hidden
set ttyfast

" ============================================================================
"  Indentation
" ============================================================================
set autoindent                                                  " Automatically indent new lines
set smartindent                                                 " -
set smarttab                                                    " -
set expandtab                                                   " -
set shiftwidth=4                                                " -
set softtabstop=4                                               " -
set tabstop=4                                                   " Make tabs 4 spaces wide

" ============================================================================
"  Text Formatting
" ============================================================================
syntax on                                                       " Enable syntax highlighting
set wrap                                                        " Wrap lines
"set linebreak                                                  " - this is a
set nolist                                                      " -
colorscheme darkZ                                               " Use this colorscheme
set cursorline                                                  " Highlight current line

" ============================================================================
"  Remapping
" ============================================================================
let mapleader=','                                               " Change mapleader
inoremap jj <ESC>                                               " exit to normal mode with 'jj'
nmap <F1> <ESC>                                                 " Map F1 to Esc instead of the stupid help crap.
inoremap <F1> <ESC>                                             " -
nnoremap <F1> <ESC>                                             " -
vnoremap <F1> <ESC>                                             " -
nnoremap ' `                                                    " -
nnoremap ` '                                                    " -
nnoremap <C-e> 3<C-e>                                           " -
nnoremap <C-y> 3<C-y>                                           " -
inoremap <Left> :echoe "Use h"<CR>                              " For learning vi
inoremap <Right> :echoe "Use l"<CR>                             " -
inoremap <Up> :echoe "Use k"<CR>                                " -
inoremap <Down> :echoe "Use j"<CR>                              " -
nnoremap <Left> :echoe "Use h"<CR>                              " For learning vi
nnoremap <Right> :echoe "Use l"<CR>                             " -
nnoremap <Up> :echoe "Use k"<CR>                                " -
nnoremap <Down> :echoe "Use j"<CR>                              " -
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

" ============================================================================
"  UI
" ============================================================================
set title                                                       " Show the filename in the window titlebar
set ruler                                                       " Show the cursor position
set showcmd                                                     " Don not display incomplete commands
"set noshowcmd                                                   " Don not display incomplete commands
set number                                                      " Enable line numbers
set numberwidth=3                                               " Width of line number column
if exists("&relativenumber")                                    " Use relative line numbers
    set relativenumber                                          " -
    au BufReadPost * set relativenumber                         " -
endif                                                           " -
set ch=2                                                        " Command line height
set nostartofline                                               " Avoid moving cursor to BOL when jumping around
set whichwrap=b,s,h,l,<,>                                       " <BS> <Space> h l <Left> <Right> can change lines
set backspace=start,eol,indent                                  " allow backspacing over anything when in insert mode
set shortmess=atI                                               " shorten messages
set report=0                                                    " : commands always print changed line count.
set nostartofline                                               " Avoid moving cursor to BOL when jumping around
set history=1000                                                " Number of command lines stored in the history tables.
set undolevels=1000                                             " Number of levels of undo
set encoding=utf-8 nobomb                                       " Use UTF-8 without BOM
set showmode                                                    " Show the current mode
set winaltkeys=no                                               " -
set scrolloff=3                                                 " Keep 3 context lines above and below the cursor
set guifont=Consolas:h8:cANSI                                   " Use this font
set guicursor=a:blinkon0                                        " Use this font
autocmd InsertLeave * se nocul                                  " Remove line highlight when leaving insert mode
autocmd InsertEnter * se cul                                    " Highlight current line in insert mode.

" ============================================================================
" Autocompletion
" ============================================================================
set wildmenu                                                    " Enhance command-line completion
set wildmode=list:longest,full                                  " -
set wildignore=.svn/*
set wildignore+=*.png,*.jpg,*.gif

" ============================================================================
" Visual Cues
" ============================================================================
" set showmatch                                                   " show matching braces/brackets
" set mat=5                                                       " How long does the matching brace show? (1-10 sec)
set incsearch                                                   " Incrementally search while typing a /regex
set laststatus=2                                                " Always show statusline, even if only 1 window.
set hlsearch                                                    " Highlight searches by default.
set ignorecase                                                  " Default to using case insensitive searches,
set smartcase                                                   " unless uppercase letters are used in the regex.
set vb t_vb=                                                    " Disable all bells.
set visualbell                                                  " -
nnoremap <leader><Space> :noh<CR>                               " Pressing the spacebar clears search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>             " Pressing the spacebar clears search highlighting
set list
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" ============================================================================
"  Strip all trailing whitespace in file
" ============================================================================
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>W :call StripWhitespace()<CR>

" ============================================================================
"  Sort CSS Properties
" ============================================================================
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" ============================================================================
"  PHP Documentor Formatting
" ============================================================================
source $HOME\vimfiles\php-doc.vim                               " Sets the location for the PHP-Doc script
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" source $HOME\vimfiles\
" ============================================================================
"  Search open doc for highlighted term
" ============================================================================
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

set gdefault                                                    " Sets all regex replaces to be global
" Highlight characters that are over the mximum length in a line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" ============================================================================
"  Unused commands
" ============================================================================
""""""""""""""""""""""""
" Load the syntax file and process for todo file types
" au BufRead,BufNewFile *.todo setfiletype todo
""""""""""""""""""""""""
""""""""""""""""""""""""
" Tell vim to remember certain things when we exit
" '10 : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20 : up to 20 lines of command-line history will be remembered
" % : saves and restores the buffer list
" n... : where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo
""""""""""""""""""""""""
""""""""""""""""""""""""
" set binary
" set noeol " Don't add empty newlines at the end of files
""""""""""""""""""""""""
""""""""""""""""""""""""
" set cursorline                            " Highlight current line
" set lcs=tab:?\ ,trail:�,eol:�,nbsp:_      " Show �invisible� characters
" set list
""""""""""""""""""""""""
