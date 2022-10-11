set t_Co=256 " make sure we support lots of colors
set background=dark " who uses a white terminal?
syntax on " disco lights on!

colorscheme gruvbox " https://github.com/morhetz/gruvbox

set incsearch " highlight search strings interactively
set hlsearch " highlight search string
set wildmenu " menu for tab completable commands
set showmatch " show matching parentheses
set smartindent " smart indenting
set tabstop=4 " yes, people still use tabs
set softtabstop=4 " four spaces for a tab
set shiftwidth=4 " for when I'm shifting block with < and >
set expandtab " two indents equals eight spaces not one tab
set modeline " read mode lines in files
set undofile " enable persistent undo
set undodir=/tmp/vimundo " keep these out of scm directories
set wildignore+=*.un~ " ignore vim's persistent undo files
set ignorecase " ignore case when searching
set smartcase " don't ignore case when search contains capitals
set formatoptions=tcq " don't get too smart for me
set spelllang=en_gb " use the right dictionary for spellings
set complete-=i " setting i can make things a bit too slow
set backspace=indent " allow backspacing over indents

" set number " number all the lines
" set cursorline " highlight the curser's line

filetype plugin on " look for filetype plugins in ~/.vim/ftplugin

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <F1> :set number!<cr>
nnoremap <F2> :set hlsearch!<cr>
nnoremap <F3> :set wrap!<cr>
nnoremap <F4> :set paste!<cr>
nnoremap <F5> :set cursorline!<cr>
nnoremap <F6> :set spell!<cr>

" Surround words with single and double quotes: \q" and \q'.
nnoremap <leader>q" ciw""<esc>P
nnoremap <leader>q' ciw''<esc>P

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

" Move the cursor back to where it was when the file was last open
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Wrap the tab key for indenting and completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endf

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
