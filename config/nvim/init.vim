set nocompatible " required by vundle
filetype off     " required by vundle
if &shell =~# 'fish$'
    set shell=sh " fish is not POSIX compatible, and breaks plugins
endif


" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jnurmine/zenburn'
Plugin 'chriskempson/base16-vim'

Plugin 'ervandew/supertab'
Plugin 'alvan/vim-closetag'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sleuth'
"Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/vim-easy-align'
Plugin 'camelcasemotion'
Plugin 'terryma/vim-expand-region'
Plugin 'rking/ag.vim'
Plugin 'luochen1990/rainbow'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'

Plugin 'dag/vim-fish'
Plugin 'elixir-lang/vim-elixir'
Plugin 'xolox/vim-misc'
Plugin 'lua.vim'
Plugin 'hylang/vim-hy'
Plugin 'fidian/hexmode'
Plugin 'fatih/vim-go'


call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax on
set background=dark
" let g:zenburn_high_Contrast=1
" let g:zenburn_old_Visual=1
colorscheme zenburn
" airline themeing
let g:airline_theme='murmur'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_section_y = '' " hide file encoding information
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto comands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  " PEP8
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal textwidth=100
  autocmd FileType python setlocal smarttab
  autocmd FileType python setlocal expandtab
  "autocmd FileType python setlocal colorcolumn=80 " a little too distracting

  " add hylang
  autocmd BufRead,BufNewFile *.hy set filetype=lisp

augroup END

" Start vim in insert mode when editing git commit messages
au FileType gitcommit 1 | startinsert

" Strip trailing white space when saving files
" probably a little dangeous
au BufWritePre * :%s/\s\+$//e

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set clipboard=unnamed " Use the OS clipboard " way too slow
set wildmenu " Enhance command-line completion
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set autoread " If a file changes outside of nvim, read in the changes
set viminfo+=! " Store upper-case registers in viminfo

" Centralize backups, swapfiles and persistent undo history
set backupdir=~/.config/nvim/backups
set backup
set backupskip=/tmp/*,/private/tmp/* " don't backup files in these folders
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Indentation settings for using 2 spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround  " When at 3 spaces and I hit >>, go to 4, not 5.

set nofoldenable  " Disable hiding things based on their indent level

" set nonumber " hide line numbers
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed
set ignorecase " Use case insensitive search...
set smartcase " except when using capital letters

set grepprg=ag " Use Silver Searcher instead of grep
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

set laststatus=2 " Always show status line
set nostartofline " Don't reset cursor to start of line when moving around.
set ruler " Show the cursor position
set shortmess=atI " Don't show the intro message when starting Neovim
set noshowmode " Show the current mode
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it's being typed
set scrolloff=3 " Start scrolling three lines before the horizontal window border
set showmatch " When typing a paren, quickly jump to its match
set matchtime=1 " Jump to matching paren very quickly

set backspace=indent,eol,start " Allow backspacing in insert mode
set history=256 " save 256 lines of the commandline history

set visualbell t_vb= " Don't beep or flash

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set cmdheight=2 " Avoid many cases of having to "press <Enter> to continue"
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0
" Remove the delay when hitting esc in insert mode
set noesckeys

" show trailing whitespace
" set listchars=tab:»·,trail:·
" set list

" remap <Leader> to the space bar
let mapleader = " "

" reload nvimrc and install plugins
nmap <Leader>bi :silent! source ~/.nvim/nvimrc<cr>:PluginInstall<cr>
" copy entire file
map <Leader>ca ggVG"*y
" ?
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
" replace all in file
map <Leader>ra :%s/
" delete all blank lines
map <Leader>db :g/^\s*$/d<CR>

map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sp yss<p>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>sg :sp<cr>:grep<space>
map <Leader>vg :vsp<cr>:grep
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>
map <Leader>f :Ag
" open new file
nnoremap <Leader>o :CtrlP<CR>
" enter visual mode
nmap <Leader><Leader> V


" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>


" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" hit v in visual mode to expand the selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Press control-s in any mode to save the file
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>li
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

" Treat a wrapped line like multiple lines
nmap k gk
nmap j gj

" Disable Ex mode
map Q <Nop>
" Disable K looking stuff up
map K <Nop>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" :W is the same as :w but faster to type
"command W w
"command Q q

" copy selection to OS X system clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
" paste the system clipboard
"map <C-v> :r !pbpaste<CR>


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" hit 12<Enter> to go to line 12
nnoremap <CR> G
" backspace moves to beginning of file
nnoremap <BS> gg

