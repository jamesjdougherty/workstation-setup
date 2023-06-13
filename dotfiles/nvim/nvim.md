### NVIM CONFIG ###

```
syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
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
set list listchars=tab:>\ ,trail:-,eol:↩

call plug#begin('~/.config/nvim/plugged')

" Terminal theme
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'overcache/NeoSolarized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Neovim lsp
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
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

lua require('dardeep')

" set background=dark
colorscheme tokyonight
"colorscheme tokyonight-storm
"colorscheme NeoSolarized
"colorscheme gruvbox
"colorscheme nordfox
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='night_owl'
 
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :hsplit<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader><leader>x :source %<CR>
:tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>= :vertical resize +25<CR>
nnoremap <silent> <leader>- :vertical resize -25<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fi <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>lr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <leader>si <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>fm <cmd>lua vim.lsp.buf.format()<cr>
```
