set background=dark " who uses a white terminal?
syntax on " disco lights on!

set incsearch " highlight search strings interactively
set hlsearch " highlight search string
set wildmenu " menu for tab completable commands
set showmatch " show matching perenthesis
set smartindent " smart indenting
set tabstop=4 " yes, people still use tabs
set softtabstop=4 " four spaces for a tab
set shiftwidth=4 " for when I'm shifting block with < and >
set expandtab " two indents equals eight spaces not one tab
set modeline " read modelines in files
set undofile " enable persitent undo
set undodir=/tmp " keep these out of scm directories
set wildignore+=*.un~ " ignore vim's persistent undo files
set ignorecase " ignore case when searching
set smartcase " don't ignore case when search contains capitals

nnoremap <F1> :set ignorecase!<cr>
nnoremap <F2> :set hlsearch!<cr>
nnoremap <F3> :set paste!<cr>
nnoremap <F4> :set wrap!<cr>
nnoremap <F5> :if exists("g:syntax_on") <bar> syntax off <bar> else <bar> syntax enable <bar> endif<cr>
nnoremap <F6> :set cursorline!

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
