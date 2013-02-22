set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" =============================================================================
" ==== Custom options - Jamie Sharpe ==========================================
" =============================================================================
" ==== General Options {{{
    :set shortmess+=I " Remove Intro message upon startup
    :set ff=unix " UNIX file format (<NL> line endings)
    :set colorcolumn=80 " Places a column bar in editor 80 chars in
    "set guioptions-=m " remove menu bar (File|Edit|Tools|...)
    set guioptions-=T " remove toolbar (icons)
    "set guioptions-=r " remove right scroll bar
    set guioptions-=l " remove left scroll bar
    set guioptions-=b " remove bottom scroll bar
    cd C:\Users\JSharpe\Documents " change the current dir
    set scrolloff=3 " minimum lines to show
    colorscheme desert " change colour scheme
    set ruler " Show columns and rows
    set cursorline " highlight current line
    set number " line-numbers
    "set hidden " buffer change, more undo
    set history=200 " default 20
    "set iskeyword+=_,$,@,%,# " not word dividers
    set laststatus=2 " always show statusline
    set listchars=tab:>\ " > to highlight <tab>
    set list " displaying listchars
    "set mouse=a " mouse in all modes
    "set nocompatible " don't vi-compatible
    "set noshowmode " hide mode in cmd-line
    "set noexrc " don't use other .*rc(s)
    "set nostartofline " no goto #1 char in line
    "set nowrap " don't wrap lines
    set numberwidth=5 " 99999 lines
    set noerrorbells " Remove beep on error
    set novisualbell " Remove visuals on error 
    set t_vb= " Remove visuals on error
    "set tmenu=500 " define a tip for menu or tool
    "set relativenumber " Show line number relative to current line
    """ Folding {{{
        set foldcolumn=4 " coloumn width showing open/closed folds
        set foldmethod=indent " folds using indent
        set foldnestmax=10 " max 10 nested folds
        set foldlevelstart=99 " folds open by default
        set foldenable "fold by default
        "set nofoldenable "dont fold by default
        set foldlevel=1 "this is just what i use
    """ end of Folding }}}
    """ Search and replace {{{
        "set gdefault " default s//g (global)
        set incsearch " "live"-search
        set ignorecase " case insensitive search
    """ end of Search and replace }}}
    """ Matching {{{
        set matchtime=2 " time to blink match {}
        "set matchpairs+=<:> " for ci< or ci>
        "set showmatch " tmpjump to match-bracket
    """ end of Matching }}}
    """ Return to last edit position when opening files {{{
        "autocmd BufReadPost *
        "    \ if line("'\"") > 0 && line("'\"") <= line("$") |
        "    \     exe "normal! g`\"" |
        "    \ endif
    """ end of Return to last edit position when opening files }}}
    """ Files {{{
        set autochdir " always use curr. dir.
        set autoread " refresh if changed
        "set backup " backup curr file
        "set backupdir=~/.vim/backup " backup director{y,ies}
        "set backupext=~ " append ~ to backups
        "set confirm " confirm changed files
        "set noautowrite " never autowrite
        set updatecount=50 " update swp after 50chars
        "" Persistent undo. Requires Vim 7.3 {{{
            "if has('persistent_undo') && exists("&undodir")
            "    set undodir=~/.vim/undo/ " where to store undofiles
            "    set undofile " enable undofile
            "    set undolevels=500 " max undos stored
            "    set undoreload=10000 " buffer stored undos
            "endif
        "" end of Persistent undo. }}}
    """ end of Files }}}
    """ Text formatting {{{
        set autoindent " preserve indentation
        set backspace=indent,eol,start " smart backspace
        set expandtab " no real tabs
        "set nrformats+=alpha " incr/decr letters C-a/-x
        set shiftround " be clever with tabs
        set shiftwidth=4 " default 8
        set smartcase " igncase,except capitals
        set smartindent " see autoindent
        set smarttab " tab to 0,4,8 etc.
        set softtabstop=4 " "tab" feels like <tab>
        set tabstop=4 " replace <TAB> w/4 spaces
        """ Only auto-comment newline for block comments {{{
            "au FileType c,cpp setlocal comments -=:// comments +=f://
        """ }}}
    """ end of Text formatting }}}
" ==== end of General Options }}}
" ==== Key mapping {{{
    """ <Ctrl-S> Saves file {{{
        nmap <c-s> :w<CR>
        imap <c-s> <Esc>:w<CR>a
    """ end of <Ctrl-S> Saves file }}}
    """ <Ctrl-l> Removes searched highlighting {{{
        nnoremap <silent> <C-l> :nohl<CR><C-l>
    """ end of <Ctrl-l> Removes searched highlighting }}}
    """ <F7> Show errow window
        nmap <F7> :cope<CR>
    """ end of <F7> show error window
    """ demap arrow key for movement {{{
        " nnoremap <up> <nop>
        " nnoremap <down> <nop>
        " nnoremap <left> <nop>
        " nnoremap <right> <nop>
        " inoremap <up> <nop>
        " inoremap <down> <nop>
        " inoremap <left> <nop>
        " inoremap <right> <nop>
    """ end of demap arrow key for movement }}}
    """ <leader>r Toggle relativenumber {{{
        nnoremap <leader>r :call NumberToggle()<CR>

        function! NumberToggle()
            if(&relativenumber == 1)
                set number
            else
                set relativenumber
            endif
        endfunction
    """ end of <leader>r Toggle relativenumber }}}
" ==== end of Key mapping }}}
" ==== Plugins
    """ NERDTree {{{
    au VimEnter * NERDTree " start NERDTree
    au VimEnter * :ReadBookmarks " open saved bookmarks
    nmap <F2> :NERDTreeToggle<CR> " toggle NERDTree
    let g:NERDTreeWinPos = "left" " on left side
    let g:NERDTreeHijackNetrw=1 " hijack default VIM tree
    let NERDTreeShowBookmarks=1 " show bookmark table
    let NERDTreeChDirMode=2 " actively change dir
    """ end of NERDTree }}}
    """ <F3> Show bufferExplorer
        nmap <F3> :BufExplorer<CR>
    """ end of <F3> Show bufferExplorer window
    """ TagList {{{
    " au VimEnter * TlistToggle " start TagList
    """ end of TagList }}}
    """ SingleCompile {{{
    nmap <F5> :SCCompile<cr> " Compile the code
    nmap <F6> :SCCompileRun<cr> " Compile and run the code
    """ end of SingleCompile }}}
    """ TagBar {{{
    au VimEnter * TagbarOpen " start Tagbar
    nmap <F8> :TagbarToggle<CR> " open Tagbar
    let g:tagbar_sort = 0 " sort by source file order
    let g:tagbar_iconchars = ['+', '-'] " icons for folding
    let g:tagbar_autoshowtag = 1 " auto expand fold
    let g:tagbar_width = 25 " width
    """ end of TagBar }}}
    """ TaskList {{{
    let g:tlWindowPosition = 1 " TaskList on bottom
    """ end of TaskList }}} 
" ==== end of Plugins
