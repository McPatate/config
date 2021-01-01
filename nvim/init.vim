set shell=/bin/bash
let mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'itchyny/lightline.vim'

Plug 'dense-analysis/ale'

Plug 'davidhalter/jedi-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'dag/vim-fish'

Plug 'rust-lang/rust.vim'

Plug 'cespare/vim-toml'

Plug 'stephpy/vim-yaml'

Plug 'plasticboy/vim-markdown'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/Users/mc/Library/Python/3.8/bin/pyls'],
    \ }

let g:ale_completion_enabled = 1

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" Quick save
nmap <leader>w :w<CR>

set laststatus=2
set noshowmode

filetype plugin indent on

syntax on

nnoremap <leader><leader> <c-^>


