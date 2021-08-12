"""""""""""""""""" 
" Plugin List
"
"""""""""""""""""" 
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jcherven/jummidark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'metakirby5/codi.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()


"""""""""""""""""" 
" Color & Fonts
"
"""""""""""""""""" 
colorscheme OceanicNext
set encoding=UTF-8
set guifont=Liga\ Ubuntu\ Mono,\ Regular

""""""""""""""""""""""""""
" Keyboard Shortcut
"
""""""""""""""""""""""""""
nmap <F6> :NERDTreeToggle<CR>
map <C-Up> :m -2<CR>
map <C-k> :m -2<CR>
map <C-Down> :m +1<CR>
map <C-j> :m +1<CR>
nnoremap d "_d
nnoremap c d
nnoremap C D
vnoremap c d
nnoremap x "_x
nnoremap <C-p> :FZF<Cr>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv


""""""""""""""""""""""""""
" Indentation
"
""""""""""""""""""""""""""
set autoindent
set smarttab
set smartindent
set softtabstop=4
set expandtab
set shiftwidth=4

set nu
set nornu
set ignorecase
runtime macros/matchit.vim
set clipboard=unnamed
let g:NERDTreeWinPos = "right"
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled=1
let g:user_emmet_leader_key=','
