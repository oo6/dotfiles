set number
set backspace=indent,eol,start

" Practical vim
" essential.vim
set nocompatible
filetype plugin on

" motions/disable-arrowkeys.vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" highlight search
set hlsearch
set incsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" zsh style completion
set wildmenu

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
packadd! onedark.vim
colorscheme onedark

Plug 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set laststatus=2
set noshowmode

Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nnoremap <silent> gd <Plug>(coc-definition)

" Plug 'tpope/vim-projectionist'
" Plug 'vim-test/vim-test'

Plug 'sheerun/vim-polyglot'

" elixir
Plug 'elixir-editors/vim-elixir'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
