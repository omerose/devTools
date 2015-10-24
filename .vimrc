" my vimrc
"
" create local leader and leader keys
" now pressing "-" and then a key can have a second functionality
:let mapleader = "-"
:let maplocalleader = "\\"

"Add newline when hit enter (when not in any modes)
:nmap <S-Enter> O<Esc>
:nmap <CR> o<Esc>
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

" enter paste mode by pressing F2, to paste without indents due to auto indent
set pastetoggle=<F2>

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

