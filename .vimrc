execute pathogen#infect()

syntax on
filetype plugin indent on

set number
set relativenumber
set ttyfast
set mouse=a
set ignorecase
set smartcase
set hlsearch
set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set showcmd
set listchars=tab:»\ ,extends:>,precedes:<,nbsp:·,trail:·
set list
set tabstop=4 
set shiftwidth=4 
set expandtab
set wrap!
set hidden

"let g:gruvbox_contrast_dark = 'medium'
autocmd vimenter * colorscheme gruvbox
set background=dark

"set cursorline
set cursorcolumn
"hi CursorLine cterm=NONE ctermbg=gray
"hi CursorColumn cterm=NONE ctermbg=gray

set laststatus=2

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %m 
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=%#StatusLineNC#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"makes switching between buffers easier
nnoremap gb :ls<CR>:b<Space>

"jj in insert mode equivalent to esc
imap jj <Esc>

set splitbelow
set splitright

autocmd FileType robot setlocal commentstring=#\ %s
