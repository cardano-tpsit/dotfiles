" ===== BASIC =====
set nocompatible
filetype plugin indent on
syntax on

" ===== UI =====
set number              " numeri di riga
set relativenumber      " numeri relativi
" set cursorline          " evidenzia riga corrente
set showcmd             " mostra comandi mentre scrivi
set wildmenu            " autocomplete comandi
set scrolloff=5         " margine quando scrolli

" ===== SEARCH =====
set ignorecase
set smartcase
set incsearch
set hlsearch

" ===== INDENT =====
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" ===== CLIPBOARD =====
set clipboard=unnamedplus

" ===== BACKUP / SWAP =====
set nobackup
set nowritebackup
set noswapfile

" ===== MOUSE (facoltativo) =====
set mouse=a

" ===== COLORS =====
set termguicolors
colorscheme PaperColor
set background=dark

" ===== KEYMAP UTILI =====
" let mapleader = " "

" salva con Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" esci con Ctrl+q
nnoremap <C-q> :q<CR>

" togli highlight ricerca con leader+h
nnoremap <leader>h :nohlsearch<CR>

" copia negli appunti di sistema
vnoremap <leader>y "+y
nnoremap <leader>y "+yy

" incolla da clipboard
nnoremap <leader>p "+p
