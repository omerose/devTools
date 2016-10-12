" Dylan Vann's vimrc. modified with 1dose vimrc

" launch NERDTree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" remap jk to escape
inoremap jk <Esc>

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
"set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
:set tabstop=2 shiftwidth=2 expandtab
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" show hidden characters in Vim
:set list

" settings for hidden chars
" what particular chars they are displayed with
:set lcs=tab:▒░,trail:▓
" or
:set listchars=tab:▒░,trail:▓
" used \u2592\u2591 for tab and \u2593 for trailing spaces in line.
" In Vim help they suggest using ">-" for tab and "-" for trail.

" hide hidden chars
:set nolist
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Remap escape to jk, because my pinky hurts.
:inoremap jk <Esc>l

" Caseless.
:set ignorecase
:set smartcase

:nmap <Leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" Disable annoying beeps.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Easier split navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Setups spaces instead of tabs.
set expandtab
set shiftwidth=2
set softtabstop=2

set autoindent
filetype plugin indent on

let g:indentLine_color_term = 239

" Speed up scrolling.
set ttyfast

" Paste toggling.
set pastetoggle=<F2>

" Auto paste toggling.
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

set lazyredraw


if filereadable(glob("~/.vimrc.bundles"))
				source ~/.vimrc.bundles
endif

" my vimrc
"
" create local leader and leader keys
" now pressing "-" and then a key can have a second functionality
:let mapleader = "-"
:let maplocalleader = "\\"

"Add newline when hit enter (when not in any modes)
":nmap <S-Enter> O<Esc>
":nmap <CR> o<Esc>

"Refresh the file to see updates of another application made changes
:map <F5>  :edit!<CR>

"Map the numpad keys
:inoremap <Esc>Oq 1
:inoremap <Esc>Or 2
:inoremap <Esc>Os 3
:inoremap <Esc>Ot 4
:inoremap <Esc>Ou 5
:inoremap <Esc>Ov 6
:inoremap <Esc>Ow 7
:inoremap <Esc>Ox 8
:inoremap <Esc>Oy 9
:inoremap <Esc>Op 0
:inoremap <Esc>On .
:inoremap <Esc>OQ /
:inoremap <Esc>OR *
:inoremap <Esc>Ol +
:inoremap <Esc>OS -

":set tw=78               "always limit the width of text to 78
:set bs=2                "allow backspacing over everything in 'insert' mode
:set et                  "expand tabs to spaces.
:set shiftwidth=3        "for >> indenting
:set tabstop=3           "the amount of space a tab moves
:set scrolloff=3         "set to have some lines visible around the line you are working on at all times

":set nu                  "show line number in front of every line  (without underlines)
":set number              "show line number in front of every line
:set autoindent          "automatically indents for you 
:set cindent             "auto indents closing bracket/brace/parenth
:set showmatch           "Show matching bracets when text indicator is over them

":set backup              "keep a backup file
:set nobackup            "don't keep a backup file
:set showcmd             "show incomplete commands [like d 22 ]

:set hls                 "hightlight all search pattern matches
:set ignorecase          "ignore case of letters when doing a search
:set smartcase           "if you type capital only searches for capital
:set incsearch           "incremental search means to show results of search as you type it out

"Ctrl + S to save
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>a  

"Ctrl+q to quit, hold shift to discard
map <C-q> :q<cr>
imap <C-q> <ESC>:q<cr>
map <C-S-q> :q!<cr>
imap <C-S-q> <ESC>:q!<cr>
"No F1 troubles again
:map <F1> <Esc>
:imap <F1> <Esc>

"Don't let ctrl+Z screw you over by accidentally exiting
map <C-z> :u<cr>
imap <C-z> <ESC>:u<cr> 


:syntax enable           "enable colors in vim
filetype plugin indent on
set encoding=utf-8

:if $TERM == "xterm-256color"
   set t_Co=256
endif

"Mouse Wheeling

"set mouse=a
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>

"Scheme name:           Score:
"colorscheme blue       " 0/5
"colorscheme morning    " 0/5
"colorscheme shine      " 0/5
"colorscheme pablo      " 1/5
"colorscheme torte      " 1/5
"colorscheme darkblue   " 1/5
"colorscheme default    " 3/5
"colorscheme delek      " 3/5
"colorscheme elflord    " 3/5
"colorscheme evening    " 3/5
"colorscheme peachpuff  " 3/5
"colorscheme ron        " 3/5
"colorscheme zellner    " 3/5
"colorscheme desert     " 4/5
"colorscheme murphy     " 4/5
colorscheme koehler     " 5/5

:set tags=/vbs/engn/cscope/tags
:if has("cscope")
    set csprg=/path/to/cscope/bin/cscope-15.5
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
else
    echo "no cscope"
endif

set lazyredraw          " redraw only when we need to.



" turn off search highlight with spacebar
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>d :call InsertDebugJavascript()<CR>

" enter paste mode by pressing leaderkey p, to paste without indents due to auto indenting
nnoremap <leader>p :set invpaste paste?<CR>
imap <leader>p <C-O>:set invpaste paste?<CR>

" disable auto-commenting after inserting a new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

:command WQ wq
:command Wq wq
:command W w
:command Q q

" functions

" very specific function for getting format to excel
function Coords2Excel()
   :%s/\((\d*,\d*)\)\(.*\)/\1\2, \1 
   :%s/(\|)//g
   :%s/\n/\r\r/g
   :%s/, /\r/g
   :%s/\s\+$//
endfunction

" Use when you have two columns x,y and nothing else
" Need to test, not sure
function CtoG()
   :%s/\(\d\)\(\d\d\d,\)/\1,\2/g
   :%s/\(\d\)\(\d\d\d\n\)/\1,\2\r/g
   :%s/^/X/g
   :%s/,/ Y/g
endfunction

" add debug statements on javascript
function InsertDebugJavascript()
   :let lineNum = line(".") + 1
   :let output = "console.log(\"dV: ".expand('%:t').":".lineNum."\");"
   :exe ":normal o" . output
endfunction

" add debug statements on javascript
function InsertDebugJavascriptLong()
   :let lineNum = line(".") + 1
   :let output = "console.log(\"debugVIM: ".expand('%:p').":".lineNum." ".strftime("%c")."\");"
   :exe ":normal o" . output
endfunction

" neocomplete Pmenu background color was magenta and text not visible, this
" changes it to a visible color
highlight Pmenu ctermbg=2
