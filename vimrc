""" vimrc
" Setup Vundle: https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           " Great vim plugin bundler
Plugin 'flazz/vim-colorschemes'         " Lots of colorschemes
Plugin 'ctrlpvim/ctrlp.vim'             " Fuzzy finder
Plugin 'tpope/vim-commentary'           " commenting lines in vim
Plugin 'leshill/vim-json'               " Proper JSON filetype detection, and support
Plugin 'pangloss/vim-javascript'        " Better javascript indent support
Plugin 'vim-scripts/indenthtml.vim'     " Better html indent support
Plugin 'tpope/vim-markdown'             " Better markdown syntax support
Plugin 'neovimhaskell/haskell-vim'      " Syntax and indentation for haskell

call vundle#end()

filetype plugin indent on       " Filetype auto-detection
syntax on                       " Syntax highlighting

""" colorscheme
colorscheme space-vim-dark
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE


""" vimrc autoreload on save
if has ('autocmd')
    augroup myvimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC :source $MYVIMRC
    augroup END
endif


""" Haskell
let g:haskell_classic_highlighting = 1
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


""" Usability
let mapleader=" "

set number                      " line numbers
set wildmenu                    " cmd-line completion
set showcmd                     " show partial commands
set ruler                       " display cursor position
set laststatus=2                " always display last status line
set backspace=indent,eol,start  " allow backspace over autoindents, eol, insert
set confirm                     " confirm save instead of failing
set mouse=a                     " can use mouse in all modes
set cmdheight=2                 " cmd window height is 2
set hidden                      " allows buffers with unsaved changes
"set autoread                    " autoread files when changed on disk

" Tabs and indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab           " use spaces instead of tabs
set smarttab            " lets tab key insert 'tab stops', and bksp deletes tabs
set shiftround          " tab / shifting moves to closest tabstop
set autoindent          " Match indents on new lines
set smartindent         " Intellegently dedent / indent new lines based on rules
" Visualize whitespace
set listchars=tab:▸\ ,eol:¬
set list
" Toggle tabs and EOL
noremap <leader><space> :set list!<CR>

" for depending solely on VCS
"set nobackup
"set nowritebackup
"set noswapfile

" Better search settings
set ignorecase          " case insensitive search
set smartcase           " If there are uppercase letters, become case-sensitive
set incsearch           " live incremental searching
set showmatch           " live match highlighting
set hlsearch            " highlight matches
set gdefault            " use the `g` flag by default
" Clear match highlighting
noremap <leader>l :noh<cr>:call clearmatches()<cr>


""" Convenience
" easier exiting insert mode
inoremap jf <esc>

" create new v/h split and switch to it
noremap <leader>v <C-w>v
noremap <leader>h <C-w>S

" easier navigation in split screen
nnoremap <C-S-h> <C-w>h
nnoremap <C-S-j> <C-w>j
nnoremap <C-S-k> <C-w>k
nnoremap <C-S-l> <C-w>l

" move by visual line (fixes move line when line is wrapped)
noremap j gj
noremap k gk

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c :Commentary<cr>

