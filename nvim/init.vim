" modeline {{{
"     vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker
" }}}

set nocompatible " be iMproved, required
filetype off     " required

let mapleader = ','

" plugins {{{
    set runtimepath+=~/.config/nvim/bundle/Vundle.vim
    call vundle#begin('~/.config/nvim/bundle')

    Plugin 'VundleVim/Vundle.vim'             " required
    Plugin 'a.vim'                            " cpp header/source quick switch
    Plugin 'tpope/vim-fugitive'               " git for vim
    Plugin 'Lokaltog/vim-easymotion'          " better motion control
    Plugin 'tpope/vim-commentary'             " better commenting/uncommenting
    Plugin 'godlygeek/tabular'                " code alignment
    Plugin 'sirver/ultisnips'                 " code snippet engine
    Plugin 'honza/vim-snippets'               " various code snippets
    Plugin 'raimondi/delimitmate'             " auto insertion of pairs, like {}, () etc
    Plugin 'mileszs/ack.vim'                  " better grep tool, using the silver searcher
    Plugin 'junegunn/fzf'                     " fuzzy finder
    Plugin 'junegunn/fzf.vim'                 " vim plugin fuzzy finder
    Plugin 'Valloric/YouCompleteMe'           " code completion engine, using libclang for C/C++
    Plugin 'scrooloose/nerdtree'              " filesystem tree in vim
    Plugin 'Xuyuanp/nerdtree-git-plugin'      " show git file status in NERDTree
    Plugin 'airblade/vim-gitgutter'           " show git file change when editing
    Plugin 'flazz/vim-colorschemes'           " various color schemes
    Plugin 'tomasr/molokai'                   " the famous molokai theme
    Plugin 'altercation/vim-colors-solarized' " the famous solarized theme
    Plugin 'joshdick/onedark.vim'             " the great onedark theme
    Plugin 'sheerun/vim-polyglot'             " better syntax highlighting
    Plugin 'vim-airline/vim-airline'          " better tabline and statusline
    Plugin 'vim-airline/vim-airline-themes'   " themes for airline

    call vundle#end()
" }}}

filetype plugin indent on " required
syntax on " enable syntax highlight and completion

" color scheme {{{
    set background=dark
    color solarized
    " colorscheme onedark
    " colorscheme wombat
    " colorscheme molokai
" }}}

" common settings {{{
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 " encoding dectection
    set viewoptions=folds,options,cursor,unix,slash                 " effect to be saved and restored
    set hlsearch                                                    " highlight searching
    set incsearch                                                   " incremental searching
    set ignorecase                                                  " ignore case when searching
    set smartcase                                                   " do not ignore case when upper case characters exist in search pattern
    set history=1000                                                " maximum history count of ':' commands and search patterns
    set spell                                                       " set spell checking on
    set nobackup                                                    " don't backup
    set nowritebackup                                               " don't do writable backup
    set noswapfile                                                  " don't create .swp file
    set autoread                                                    " auto read file if it is changed outside
    set hidden                                                      " allow buffer switch without save
    set nofoldenable                                                " enable folding
    set foldmethod=syntax                                           " folding according to syntax
    set confirm                                                     " prompt when existing from an unsaved file
    set backspace=indent,eol,start                                  " more powerful backspacing
    set t_Co=256                                                    " explicitly tell vim that the terminal has 256 colors
    set showmode                                                    " show mode on status line
    set ruler                                                       " show line and column numer of current position
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)              " a ruler on steroids
    set number                                                      " show line numbers
    " set relativenumber                                            " show relative line number
    set cursorline                                                  " highlight current line
    set cursorcolumn                                                " highlight current column
    set linespace=0                                                 " do not show any pixels between lines
    set mouse=a                                                     " use mouse in all modes
    set mousehide                                                   " hide the mouse cursor while typing
    set report=0                                                    " always report number of lines changed
    set nowrap                                                      " don't wrap lines
    set scrolloff=5                                                 " 5 lines above/below cursor when scrolling
    set number                                                      " show line numbers
    set showcmd                                                     " show typed command in status bar
    set title                                                       " show file in titlebar
    set laststatus=2                                                " always use a status line
    set showmatch                                                   " show matching bracket (briefly jump)
    set matchtime=2                                                 " show matching bracket for 0.2 seconds
    set list                                                        " highlight problematic whitespace
    " set listchars=tab:›\ ,trail:•,extends:#,nbsp:*                " change style of problematic whitespace
    set listchars=tab:>-,trail:-,extends:#,nbsp:*                   " change style of problematic whitespace
    set wildignore+=*.o,*.obj,.svn,.git                             " update ignore lists
    set autoindent                                                  " autoindenting
    set smartindent                                                 " smart autoindenting when starting a new line
    set tabstop=4                                                   " number of spaces that a tab counts for
    set softtabstop=4                                               " number of spaces that a tab counts for while performing editing operations
    set shiftwidth=4                                                " number of spaces to use for each step of (auto)indent
    set expandtab                                                   " use the appropriate number of spaces to insert a tab
    set smarttab                                                    " a tab in front of a line inserts blanks according to shiftwidth
" }}}

" common mappings {{{
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    nnoremap j gj
    nnoremap k gk

    vnoremap < <gv
    vnoremap > >gv

    " copy/paste from/to system clipboard
    vnoremap <Leader>y  "+y
    vnoremap <Leader>p  "+p
    nnoremap <Leader>p  "+p
    nnoremap <Leader>yy "+yy
    nnoremap <Leader>yw "+yiw
    nnoremap <Leader>y' "+yi'
    nnoremap <Leader>y" "+yi"

    nnoremap <A-,> <C-o>

    nnoremap <Leader>ec :e ~/.config/nvim/init.vim<CR>
" }}}

" common auto commands {{{
    autocmd BufWinLeave * silent! mkview     " make vim save view (state) (folds, cursor, etc)
    autocmd BufWinEnter * silent! loadview   " make vim load view (state) (folds, cursor, etc)

    autocmd WinLeave * set nocursorline nocursorcolumn " disable highlighting when leaving
    autocmd WinEnter * set cursorline cursorcolumn     " enable highlighting when leaving

    autocmd FileType xml,html setlocal matchpairs+=<:>

    " change C/C++ comment style, /* xxx */ => // xxx
    autocmd FileType c,cpp setlocal commentstring=//\ %s
" }}}

" plugin settings {{{
    " easy-motion {{{
        " use original <Leader><Leader> to avoid conflicts
        " let g:EasyMotion_leader_key = '<Leader>'
    " }}}

    " tabular {{{
        nnoremap <Leader>= :Tabularize /=<CR>
        vnoremap <Leader>= :Tabularize /=<CR>
    " }}}

    " commentary {{{
        " C-_ means C-/, see
        " https://github.com/tpope/vim-commentary/issues/36
        nmap <C-_> <Plug>CommentaryLine
        vmap <C-_> <Plug>Commentary
    " }}}

    " ultisnips {{{
        let g:UltiSnipsExpandTrigger = '<C-l>'
        let g:UltiSnipsJumpForwardTrigger = '<C-l>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
    " }}}

    " delimitmate {{{
        let delimitMate_expand_cr = 1
    " }}}

    " YCM {{{
        nmap <A-.> :YcmCompleter GoTo<CR>
    " }}}

    " a.vim {{{
        nmap <A-o> :A<CR>
    " }}}

    " ack.vim {{{
        let g:ackprg = 'ag --vimgrep'
        nnoremap <Leader>a :Ack!<Space>
    " }}}

    " fzf {{{
        let g:fzf_command_prefix = 'Fzf'
        nnoremap <Leader>ff :FzfFiles<CR>
        nnoremap <Leader>fb :FzfBuffers<CR>
        nnoremap <Leader>fl :FzfLines<CR>
    " }}}

    " NERDTree {{{
        nnoremap <A-0> :NERDTreeToggle<CR>
    " }}}

    " NERDTree git plugin {{{
        let g:NERDTreeShowIgnoredStatus = 1
        let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
        \ }
    " }}}

    " gitgutter {{{
        set updatetime=250
    " }}}

    " airline {{{
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#ycm#enabled = 1        " YCM
        let g:airline#extensions#hunks#enabled = 1      " gitgutter
        let g:airline#extensions#tagbar#enabled = 1     " tagbar
        let g:airline#extensions#branch#enabled = 1     " fugitive
        let g:airline#extensions#tabline#enabled = 1    " built-in tabline
        let g:airline#extensions#wordcount#enabled = 1  " built-in wordcount
        let g:airline#extensions#syntastic#enabled = 1  " syntastic
        let g:airline#extensions#tabline#buffer_idx_mode = 1

        nmap <A-1>     <Plug>AirlineSelectTab1
        nmap <A-2>     <Plug>AirlineSelectTab2
        nmap <A-3>     <Plug>AirlineSelectTab3
        nmap <A-4>     <Plug>AirlineSelectTab4
        nmap <A-5>     <Plug>AirlineSelectTab5
        nmap <A-6>     <Plug>AirlineSelectTab6
        nmap <A-7>     <Plug>AirlineSelectTab7
        nmap <A-8>     <Plug>AirlineSelectTab8
        nmap <A-9>     <Plug>AirlineSelectTab9
        nmap <A-b>     <Plug>AirlineSelectPrevTab
        nmap <A-f>     <Plug>AirlineSelectNextTab
        nmap <A-Tab>   <Plug>AirlineSelectNextTab
    " }}}
" }}}
