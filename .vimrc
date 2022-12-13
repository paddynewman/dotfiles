set t_Co=256 " make sure we support lots of colors
set background=dark " who uses a white terminal?
syntax on " disco lights on!
colorscheme gruvbox " https://github.com/morhetz/gruvbox

set smartcase " don't ignore case when search contains capitals
set ignorecase " ignore case when searching
set incsearch " highlight search strings interactively
set hlsearch " highlight search string
set wildmenu " menu for tab completable commands
set wildignorecase " ignore case for completions
set wildignore+=*.un~ " ignore vim's persistent undo files
set smartindent " smart indenting
set tabstop=4 " yes, people still use tabs
set softtabstop=4 " four spaces for a tab
set shiftwidth=4 " for when I'm shifting block with < and >
set expandtab " two indents equals eight spaces not one tab
set showmatch " show matching parentheses
set modeline " read mode lines in files
set undofile " enable persistent undo
set undodir=/tmp/vimundo " keep these out of scm directories
set formatoptions=tcq " don't get too smart for me
set spelllang=en_gb " use the right dictionary for spellings
set complete-=i " setting i can make things a bit too slow
set backspace=indent " allow backspacing over indents

" Look for filetype plugins in ~/.vim/ftplugin/*.
filetype plugin on

" Navigate windows using CTL+h,j,k and l.
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Function key mappings.
nnoremap <F1> :set number!<cr>
nnoremap <F2> :set hlsearch!<cr>
nnoremap <F3> :set wrap!<cr>
nnoremap <F4> :set paste!<cr>
nnoremap <F5> :set cursorline!<cr>
nnoremap <F6> :set spell!<cr>
vnoremap <F7> :s/^/# /<cr>:set nohlsearch<cr>

" Leader-based mappings.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:echom "reloaded .vimrv"<cr>

" Surround words with single and double quotes: \q" and \q'.
nnoremap <leader>q" ciw""<esc>P
nnoremap <leader>q' ciw''<esc>P

" Read man page and Python documentation.
nnoremap <leader>mp :!man <cword><cr>
nnoremap <leader>pd :!pydoc3 <cword><cr>

" Don't put the # character in the first column.
inoremap # X#

" I often type "Q!" when I mean to type "q!".
cnoremap Q! q!

" Fix a few of my common typos.
abbreviate FIle File
abbreviate DIr Dir
abbreviate DUmper Dumper
abbreviate samaba samba
abbreviate warnigns warnings
abbreviate versino version
abbreviate statys status
abbreviate OPenStack OpenStack

" Move the cursor back to where it was when the file was last opened.
augroup return_curser
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

" Wrap the tab key for indenting and completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endf

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
