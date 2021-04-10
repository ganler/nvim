call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'davidhalter/jedi-vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdcommenter'
  
  Plug 'prabirshrestha/vim-lsp'
  Plug 'lighttiger2505/deoplete-vim-lsp'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()


"Config Section
" setting with vim-lsp
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" For deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:loaded_python_provider = 0  " I don't use Python2
let g:deoplete#enable_at_startup = 1
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
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

