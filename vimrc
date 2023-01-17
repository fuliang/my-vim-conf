" Basic
set nocompatible        " Must be first line
set background=dark     " Assume a dark background

" Setup Bundle Support
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'fatih/vim-go'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'spf13/vim-colors'
Bundle 'rhysd/conflict-marker.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'matchit.zip'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'
Bundle 'klen/python-mode'
Bundle 'yssource/python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'powerline/fonts'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-markdown'
Bundle 'gcmt/wildfire.vim'

" Configuration of vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd guibg=red ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=black
hi IndentGuidesEven guibg=green ctermbg=darkgrey

" Configuration of YouCompleteMe
let g:ycm_confirm_extra_conf = 0
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:neocomplete#enable_at_startup = 0
let g:ycm_global_ycm_extra_conf = '/root/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '**'

" Configuration of NerdTree
if isdirectory(expand("~/.vim/bundle/nerdtree"))
  map <C-e> <plug>NERDTreeTabsToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0
endif

" Initialize NERDTree as needed {
function! NERDTreeInitAsNeeded()
  redir => bufoutput
  buffers!
  redir END
  let idx = stridx(bufoutput, "NERD_tree")
  if idx > -1
    NERDTreeMirror
    NERDTreeFind
    wincmd l
  endif
endfunction

" Configuration of vim-airline
"if isdirectory(expand("~/.vim/bundle/vim-airline/"))
"  if !exists('g:airline_theme')
"    let g:airline_theme = 'solarized'
"  endif
"  if !exists('g:airline_powerline_fonts')
"    " Use the default set of separators with a few customizations
"    let g:airline_left_sep='›'  " Slightly fancier than '>'
"    let g:airline_right_sep='‹' " Slightly fancier than '<'
"  endif
"endif

" Configuration of statusline
if has('statusline')
  set laststatus=2
  set t_Co=256
  let g:Powerline_symbols="unicode"
  set encoding=utf8
  if !exists('g:override_spf13_bundles')
    set statusline+=%{fugitive#statusline()} " Git Hotness
  endif
endif

" Configuration of fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  " Mnemonic _i_nteractive
  nnoremap <silent> <leader>gi :Git add -p %<CR>
  nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

" user interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set font
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12

"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"language messages zh_CN.utf-8
language messages en_US.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80
set ruler
set nocp                    " nocompatible :get rid of vi-compatible
set sc                      " showcmd :show command in the last line of screen
set smd                     " showmode :show what mode it is now(Insert, Replace or Visual)
set history=400             " cmdline-history :how many cmd history to remember

set so=2                    " scrolloff :7 lines to keep above and below the cursor
set nu                      " number :show line number
set cul                     " cursorline :hightlight currentline

set tw=0                    " textwidth :don't auto break a line

set bs=2                    " backspace :so you can use backspace to delete everything
"set ww+=h,l                 " whichwrap :so you can use h/l to move to the previous/next line 

""" restore cursor to file position in previous editing session
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""" no errorbells
set noeb                    " noerrorbells
set novb                    " novisualbell
set t_vb=

""" set mapleader
let mapleader=","
let g:mapleader=","

inoremap jj <Esc>

" hightlight 
syntax on                   " syntax-highlighting :turn on syntax hightlighting
"colo yerik_night            " colorscheme :my color scheme
colo gruvbox            " colorscheme :my color scheme
"colo oceanblack256            " colorscheme :my color scheme
"colo emacs            " colorscheme :my color scheme
"colo flattr            " colorscheme :my color scheme
"colo skittles_dark           " colorscheme :my color scheme
"colo jellybeans          " colorscheme :my color scheme
"colo  summerfruit256          " colorscheme :my color scheme
"colo  tabula          " colorscheme :my color scheme
"colo  tchaba2         " colorscheme :my color scheme
"colo  Tomorrow-Night        " colorscheme :my color scheme
"colo  felipec     " colorscheme :my color scheme

" file 
"set enc=utf-8               " encoding
set fencs=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936     " fileencodings
"set ffs=unix,dos           " fileformats :auto select end-of-line formats 
set ar                      " autoread :auto read a file when it's changed outside 
set nobk                    " nobackup :don't make a backup before overwriting a file
set noswf                   " noswapfile :don't use a swapfile for the buffer

" filetype 
filetype indent plugin on
""" set indent length for html like files
au FileType html,xhtml,xml setl ts=2
au FileType html,xhtml,xml setl sts=2
au FileType html,xhtml,xml setl sw=2

" search 
set hls                     " hlsearch :highlight search
set is                      " incsearch :increase search
set ic                      " ignorecase :ignore case when searching
set scs                     " smartcase :if has upper case, ignore 'ignorecase' option

map <leader>h *N            " <leader>h to highlight all word the same to which under cursor

" basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"map <space> :nohl<CR>       " :press <space> to clear hightlight search highlight

" status line 
set ls=2                    " laststatus :always show status line

" statusline :display useful information on status line
set stl=\ [%F%m%r%h\%w]             " file path and some tags
set stl+=[%{getcwd()}]              " current directory
set stl+=%=                         " right alien
set stl+=\ \|\ %{&ff}               " file format
set stl+=\ \|\ %{&fenc}             " file encoding
set stl+=\ \|\ %l/%L:%c             " cursor position
set stl+=\ \|\ %P\                  " percentage


" programming 
""" indent
set ai                      " autoindent
set si                      " smartindent
set cin                     " cindent
set sta                     " smarttab
set et                    " noexpandtab :don't expand tab
""" tab width
set ts=2                    " tabstop
set sts=2                   " softtabstop
set sw=2                  " shiftwidth
"set tw=80

""" show tab as '|'
set listchars=tab:\|\
set list

" hot keys 
""" move between spilt views using CTRL-j,k,h,l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" auto complete 
""" command line
set wildmenu
set wildmode=longest:full

""" text
set completeopt=menu,longest
set pumheight=15

" minibufexplorer
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplorerMoreThanOne=1

set splitright
set splitbelow
set nocompatible
set mousehide
