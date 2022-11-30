set nocompatible

if &shell =~# 'fish$'
    set shell=sh " fish is not POSIX compatible, and breaks plugins
endif

call plug#begin()
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  " improve vim-surround for HTML and friends
  "Plug 'tpope/vim-ragtag'
  " Readline in vim
  Plug 'tpope/vim-rsi'
  " Make "." work for plugins
  Plug 'tpope/vim-repeat'
  " Adjust shiftwidth and expandtab based on current file
  "Plug 'tpope/vim-sleuth'
  " Closing "end", "fi", etc. statements
  Plug 'tpope/vim-endwise'

  " Git
  "Plug 'tpope/vim-fugitive'
  "Plug 'tpope/vim-rhubarb'

  " Trailing whitespace highlight
  Plug 'ntpeters/vim-better-whitespace'

  " Makes tab for autocomplete work better?
  "Plug 'ervandew/supertab'
  "Plug 'Valloric/YouCompleteMe'

  " Adds "</table>" when you write "<table>"
  Plug 'alvan/vim-closetag'
  " TODO: how's this different from vim-surround?
  "Plug 'jiangmiao/auto-pairs'

  " Nicer looking status bar
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'

  " Aligns equals signs in a group of lines
  "Plug 'junegunn/vim-easy-align'


  " ,w ,b ,e consider camelCase to be two words (unmaintained)
  Plug 'vim-scripts/camelcasemotion'
  " Press + to expand the visual selection and _ to shrink it.
  Plug 'terryma/vim-expand-region'

  " Open files by hitting ctrlp and typing the name
  "Plug 'ctrlpvim/ctrlp.vim'
  " Automatic closing of quotes, parenthesis, brackets, etc.
  Plug 'Raimondi/delimitMate'
  " Open a git diff in a seperate window when commiting
  "Plug 'rhysd/committia.vim'


  " Colors
  "Plug 'luochen1990/rainbow' " (parens)
  "Plug 'chriskempson/base16-vim'
  "Plug 'jnurmine/Zenburn'
call plug#end()

" Syntax highlighting
"syntax on
"set background=light
"colorscheme zenburn

" Airline themeing
"let g:airline_theme='sol'
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''
"let g:airline_section_y = '' " hide file encoding information
"let g:rainbow_active = 1

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
  "autocmd FileType python setlocal textwidth=88
  "autocmd FileType python setlocal colorcolumn=88 " a little too distracting

  " Strip trailing white space when saving files
  "autocmd BufEnter * EnableStripWhitespaceOnSave

  " add hylang
  autocmd BufRead,BufNewFile *.hy set filetype=lisp

  " don't move back a character when exiting insert mode
  autocmd InsertLeave * :normal `^

  autocmd FileType go setlocal tabstop=8

augroup END

" Start vim in insert mode when editing git commit messages
"au FileType gitcommit 1 | startinsert

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus " Use the OS clipboard
set wildmenu " Enhance command-line completion
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb
set autoread " If a file changes outside of nvim, read in the changes
set viminfo+=! " Store upper-case registers in viminfo

" Centralize backups, swapfiles and persistent undo history
set backupdir=~/.config/nvim/backups
set backup
set backupskip=/tmp/*,/private/tmp/* " don't backup files in these folders
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
set undofile
set undolevels=8192  "max number of changes that can be undone
set undoreload=16384 "max number of lines to save for undo on a buffer reload

" Indentation settings for using spaces instead of tabs.
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround  " When at 3 spaces and I hit >>, go to 4, not 7.

" show tabs
set list
set listchars=tab:▸·

set nofoldenable  " Disable hiding things based on their indent level

" set nonumber " hide line numbers
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed
set ignorecase " Use case insensitive search...
set smartcase " except when using capital letters

set grepprg=rg " Use ripgrep instead of grep
"let g:ctrlp_use_caching = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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
" Instead of failing a command because of unsaved changes, raise a
" dialogue asking if you wish to save changed files.
set confirm

set cmdheight=2 " Avoid many cases of having to "press <Enter> to continue"
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0

" increase how many previous lines the terminal saves from the default of 1000
let g:terminal_scrollback_buffer_size = 131072

" remap <Leader> to the space bar
let mapleader = " "

" reload nvimrc and install plugins
nmap <Leader>bi :silent! source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
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
map <Leader>fs <esc>:w<CR>
map <Leader>/ :Ag<space>

map <Leader>t :terminal<cr>
map <Leader>co :e ~/.config/nvim/init.vim<cr>

" open new file
"nnoremap <Leader>o :CtrlP<CR>
" enter visual mode
"nmap <Leader><Leader> V

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
"map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
"map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
"map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" hit v in visual mode to expand the selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"map <C-t> <esc>:tabnew<CR>
"map <C-x> <C-w>c

" move between windows with dvorak homerow
":tnoremap <A-h> <C-\><C-n><C-w>h
":tnoremap <A-t> <C-\><C-n><C-w>j
":tnoremap <A-n> <C-\><C-n><C-w>k
":tnoremap <A-s> <C-\><C-n><C-w>l
":nnoremap <A-h> <C-w>h
":nnoremap <A-t> <C-w>j
":nnoremap <A-n> <C-w>k
":nnoremap <A-s> <C-w>l

" Treat a wrapped line like multiple lines
"nmap k gk
"nmap j gj

" Disable Ex mode
map Q <Nop>
" Disable K looking stuff up
map K <Nop>

" :W is the same as :w but faster to type
"command W w
"command Q q

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>

" hit 12<Enter> to go to line 12
"nnoremap <CR> G
" backspace moves to beginning of file
"nnoremap <BS> gg

" Make Y yank until EOL, to act like D and C, rather than act as yy
map Y y$
