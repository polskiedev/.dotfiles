" Basic settings
set number                        " Show line numbers
set relativenumber                " Show relative line numbers
set tabstop=4                     " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4                  " Number of spaces to use for each step of (auto)indent
set expandtab                     " Use spaces instead of tabs
set smartindent                   " Smart autoindenting when starting a new line
set wrap                          " Wrap lines
set cursorline                    " Highlight the current line
set termguicolors                 " Enable true colors support
set background=dark               " Set background to dark for better visibility
syntax enable                     " Enable syntax highlighting
filetype plugin indent on         " Enable filetype detection, plugins, and indentation

" Key mappings
nnoremap <C-s> :w<CR>             " Save with Ctrl+s
nnoremap <C-q> :q<CR>             " Quit with Ctrl+q
nnoremap <C-a> ggVG               " Select all with Ctrl+a
nnoremap <C-z> u                  " Undo with Ctrl+z
nnoremap <C-y> <C-r>              " Redo with Ctrl+y
nnoremap <C-h> :nohlsearch<CR>    " Clear search highlighting with Ctrl+h
nnoremap <C-j> :bprev<CR>         " Go to previous buffer with Ctrl+j
nnoremap <C-k> :bnext<CR>         " Go to next buffer with Ctrl+k
nnoremap <C-e> :e <C-R>=expand("%:p:h") . "/" <CR>  " Open file in current directory with Ctrl+e

" Searching
set incsearch                     " Show match as search pattern is typed
set ignorecase                    " Ignore case when searching
set smartcase                     " Override ignorecase if search pattern contains uppercase

" Visual mode improvements
vnoremap < <gv                   " Stay in visual mode after shifting text left
vnoremap > >gv                   " Stay in visual mode after shifting text right

" Clipboard integration
set clipboard=unnamedplus        " Use system clipboard for all operations

" Mouse support
set mouse=a                      " Enable mouse support

" Split navigation
nnoremap <C-w><left> <C-w>h      " Move to left split
nnoremap <C-w><right> <C-w>l     " Move to right split
nnoremap <C-w><up> <C-w>k        " Move to upper split
nnoremap <C-w><down> <C-w>j      " Move to lower split

" Better line movement
nnoremap j gj                    " Move down by visual lines
nnoremap k gk                    " Move up by visual lines

" Persistent undo
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif

" Wildmenu for command-line completion
set wildmenu
set wildmode=longest:full,full

" Status line
set laststatus=2                 " Always show status line
set statusline=%F%m%r%h%w[%{&ff}]%=%l,%c%V%P

" Color scheme
colorscheme desert               " Set color scheme to desert (change to preferred scheme)