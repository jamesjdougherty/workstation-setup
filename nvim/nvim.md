###NVIM CONFIG###
```
syntax on

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set number
set relativenumber
set noerrorbells
set mouse=a
set incsearch

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tpope/vim-fugitive'

call plug#end()

lua require('jdough')

colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
"let g:airline_theme='night_owl'
 
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd V<bar> :Ex<bar> :vertical resize 30<CR>
nnoremap <silent> <leader>= :vertical resize +25<CR>
nnoremap <silent> <leader>- :vertical resize -25<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
```
