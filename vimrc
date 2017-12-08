" ----------------------------------------------------------------------------
" Display
" ----------------------------------------------------------------------------

set title                             " wintitle = filename - vim
set visualbell                        " no beeps or flashes

set number relativenumber             " for ease of movement
set numberwidth=5                     " show context around current cursor position
set scrolloff=8
set sidescrolloff=16
set textwidth=78                      " the line will be right after column 80, &tw+3
set colorcolumn=+3,120
set cursorline
set redrawtime=1000
set synmaxcol=512                     " don't syntax highlight long lines

if (has("nvim") && has("termguicolors"))
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" ----------------------------------------------------------------------------
" Tab line, status line, command line
" ----------------------------------------------------------------------------

set showtabline=0                     " start OFF, toggle =2 to show tab line
set laststatus=2                      " always show all statuslines

let mapleader = " "                   " set leader

" This is slow on some terminals and often gets hidden by msgs so leave it off
set noshowcmd
set noshowmode                        " don't show -- INSERT -- in cmdline

" ----------------------------------------------------------------------------
" Input
" ----------------------------------------------------------------------------

" Enable mouse
set mouse=a

" Typing key combos
set notimeout
set ttimeout


" ----------------------------------------------------------------------------
" Wild and file globbing stuff in command mode
" ----------------------------------------------------------------------------

set browsedir=buffer                  " browse files in same dir as open file
set wildmenu                          " Enhanced command line completion.
set wildmode=list:longest,full        " Complete files using a menu AND list
let &wildignorecase = v:version >= 704

" wildignore prevents things from showing up in cmd completion
" It's for things you'd NEVER open in Vim, like caches and binary files
" @see https://github.com/tpope/vim-fugitive/issues/121#issuecomment-38720847
" @see https://github.com/kien/ctrlp.vim/issues/63
" @see https://github.com/tpope/vim-vinegar/issues/61#issuecomment-167432416
" @see http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html#comment-1396330403
"
" So don't do this! There are cases where you'd edit them or their contents
"set wildignore+=.git
"set wildignore+=.hg,.svn
"set wildignore+=tags
"set wildignore+=*.manifest

" Binary
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem
set wildignore+=.sass-cache
set wildignore+=npm-debug.log
" Compiled
set wildignore+=*.marko.js
set wildignore+=*.min.*,*-min.*
" Temp/System
set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

" ----------------------------------------------------------------------------
" File saving
" ----------------------------------------------------------------------------

" reload files if they were edited elsewhere?
"set autoread

set fileformats=unix,mac,dos
" Not modifiable if no window (e.g. resourcing vimrc)
if !&modifiable | set fileformat=unix | endif

" ----------------------------------------------------------------------------
" Writing swaps
" ----------------------------------------------------------------------------

" default is on, explicitly set on here.
" pros: prevent editing stale copy of same file in two vim instances
set swapfile

" ----------------------------------------------------------------------------
" Write backups
" ----------------------------------------------------------------------------

" Use backup files when writing (create new file, replace old one with new
" one)
set writebackup
" but do not leave around backup.xyz~ files after that
set nobackup
" backupcopy=yes is the default, just be explicit. We need this for
" webpack-dev-server and hot module reloading -- preserves special file types
" like symlinks
set backupcopy=yes

" don't create backups for these paths
set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
" Make Vim able to edit crontab files again.
set backupskip+=/private/tmp/*"
set backupskip+=~/.secret/*

" undo files
" double slash means create dir structure to mirror file's path
set noundofile
set undolevels=1000
set undoreload=10000

" ----------------------------------------------------------------------------
" Write backups
" ----------------------------------------------------------------------------

" Use backup files when writing (create new file, replace old one with new
" one)
set writebackup
" but do not leave around backup.xyz~ files after that
set nobackup
" backupcopy=yes is the default, just be explicit. We need this for
" webpack-dev-server and hot module reloading -- preserves special file types
" like symlinks
set backupcopy=yes

" don't create backups for these paths
set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
" Make Vim able to edit crontab files again.
set backupskip+=/private/tmp/*"
set backupskip+=~/.secret/*

" undo files
" double slash means create dir structure to mirror file's path
set undofile
set undolevels=1000
set undoreload=10000

" ----------------------------------------------------------------------------
" Message output on vim actions
" ----------------------------------------------------------------------------

set shortmess-=f                      " (file x of x) instead of just (x of x)
set shortmess+=ilmnrxoOtWI
" Disable "Pattern not found" messages
if has('patch-7.4.314') | set shortmess+=c | endif

" ----------------------------------------------------------------------------
" Window splitting and buffers
" ----------------------------------------------------------------------------

set splitbelow
set splitright
set fillchars=vert:│                  " Vertical sep between windows (unicode)

set hidden                            " remember undo after quitting

" reveal already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen

set nostartofline                     " don't jump to col1 on switch buffer

" ----------------------------------------------------------------------------
" Trailing whitespace
" ----------------------------------------------------------------------------

set list
set listchars=
set listchars+=tab:→\
set listchars+=trail:·
set listchars+=extends:»              " show cut off when nowrap
set listchars+=precedes:«
set listchars+=nbsp:⣿

" ----------------------------------------------------------------------------
" Diffing
" ----------------------------------------------------------------------------

" Note this is += since fillchars was defined in the window config
set fillchars+=diff:⣿
set diffopt=vertical                  " Use in vertical diff mode
set diffopt+=filler                   " blank lines to keep sides aligned
set diffopt+=iwhite                   " Ignore whitespace changes

" ----------------------------------------------------------------------------
" Input auto-formatting (global defaults)
" Probably need to update these in after/ftplugin too since ftplugins will
" probably update it.
" ----------------------------------------------------------------------------

set formatoptions=
set formatoptions+=c                  " Auto-wrap comments using textwidth
" set formatoptions+=r                  " Continue comments by default
set formatoptions-=o                  " do not continue comment using o or O
set formatoptions+=q                  " continue comments with gq
set formatoptions-=a                  " auto-gq on type in comments?
set formatoptions+=n                  " Recognize numbered lists
set formatoptions+=2                  " Use indent from 2nd line of a paragraph
set formatoptions-=l                  " break lines that are already long?
set formatoptions+=1                  " Break before 1-letter words

set nrformats-=octal                  " never use octal when <C-x> or <C-a>

" ----------------------------------------------------------------------------
" Whitespace
" ----------------------------------------------------------------------------

set nowrap
set nojoinspaces                      " J command doesn't add extra space

" ----------------------------------------------------------------------------
" Indenting - overridden by indent plugins
" ----------------------------------------------------------------------------

set autoindent                        " indent when creating newline

" For autoindent, use same spaces/tabs mix as previous line, even if
" tabs/spaces are mixed. Helps for docblock, where the block comments have a
" space after the indent to align asterisks
"
" The test case what happens when using o/O and >> and << on these:
"
"     /**
"      *
"
" Refer also to formatoptions+=o (copy comment indent to newline)
set nocopyindent

" Try not to change the indent structure on "<<" and ">>" commands. I.e. keep
" block comments aligned with space if there is a space there.
set nopreserveindent

" Smart detect when in braces and parens. Has annoying side effect that it
" won't indent lines beginning with '#'. Relying on syntax indentexpr instead.
" 'smartindent' in general is a piece of garbage, never turn it on.
set nosmartindent

" Global setting. I don't edit C-style code all the time so don't default to
" C-style indenting.
set nocindent

" ----------------------------------------------------------------------------
" Tabbing - overridden by editorconfig, after/ftplugin
" ----------------------------------------------------------------------------

" use multiple of shiftwidth when shifting indent levels.
" this is OFF so block comments don't get fudged when using ">>" and "<<"
set noshiftround

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places.
set smarttab

set backspace=indent,eol,start        " bs anything

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" ----------------------------------------------------------------------------
" Match and search
" ----------------------------------------------------------------------------

set matchtime=1                       " tenths of a sec
set showmatch                         " briefly jump to matching paren?
set hlsearch
set incsearch
set wrapscan                          " Searches wrap around end of the file.
set ignorecase
" Follow smartcase and ignorecase when doing tag search
if exists('+tagcase') | set tagcase=followscs | endif
set smartcase
set re=1

" ============================================================================
" Autocommands
" ============================================================================

filetype plugin indent on
set pastetoggle=<F2>

" HACKY: try to find a better way to do this
au FileType * set fo-=c fo-=r fo-=o

" ============================================================================
" Bundles
" ============================================================================

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ----------------------------------------------------------------------------
" Navigation
" ----------------------------------------------------------------------------

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

    " Fuzzy Finder :Files as Ctrl+P
  nnoremap <c-p> :Files<cr>

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" ============================================================================
" Security
" ============================================================================

" Disallow unsafe local vimrc commands
" Leave down here since it trims local settings
set secure

" ============================================================================
" Theme
" ============================================================================

colorscheme dracula
" colorscheme snazzy
set background=dark

" ----------------------------------------------------------------------------
" Experiments
" ----------------------------------------------------------------------------

" I hate having to manually empty directories!
let g:netrw_localrmdir='rm -r'

highlight Pmenu ctermbg=75 guibg=#2c323c
highlight PmenuSel ctermbg=17 guibg=#3c4452
