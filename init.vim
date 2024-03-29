call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
  Plug 'github/copilot.vim'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'

  Plug 'vim-airline/vim-airline'
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdcommenter'
  Plug 'christoomey/vim-tmux-navigator'
  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
call plug#end()

" Config Section
set number
set expandtab

" Mapping
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^.DS_Store$']
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-x> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-clangd',
  \ 'coc-jedi',
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use TAB for completion.
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" always show signcolumns
set signcolumn=yes

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Disable Copilot by default
let g:copilot_filetypes = {
    \ '*': v:false,
    \ 'python': v:true,
    \ }

