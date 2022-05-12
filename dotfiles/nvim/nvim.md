### NVIM CONFIG ###

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

" Terminal theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Neovim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

Plug 'jremmen/vim-ripgrep'
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
nnoremap <leader>r :Rg<CR>
nnoremap <leader>pv :wincmd V<bar> :Ex<bar> :vertical resize 50<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <silent> <leader>= :vertical resize +25<CR>
nnoremap <silent> <leader>- :vertical resize -25<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
```
