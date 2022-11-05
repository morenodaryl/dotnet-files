" ################################################
" PLUGINS
" ################################################
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'https://github.com/airblade/vim-gitgutter.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'thoughtbot/vim-rspec'
  Plug 'https://github.com/tpope/vim-rails'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'morhetz/gruvbox'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

let mapleader=" " 
nnoremap <SPACE> <Nop>
" ################################################
" CUSTOM VIM SETTINGS
" ################################################
inoremap jk <ESC>
:set number relativenumber
:hi LineNr ctermfg=4
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap
set clipboard=unnamed
" set tabstop=2
set autoindent
" set clipboard=exclude:.*
nnoremap <expr> n 'Nn'[v:searchforward] . 'zz'
nnoremap <expr> N 'nN'[v:searchforward] . 'zz'
" Below allow me to move lines up and down
nnoremap <silent> <C-k> :move-2<CR>
xnoremap <silent> <C-k> :move-2<CR>gv
nnoremap <silent> <C-j> :move+<CR>
xnoremap <silent> <C-j> :move'>+<CR>gv
" Save file
nnoremap <C-s> :w<CR>
set foldmethod=manual
" copying to leader
nnoremap <leader>y "ayy
xnoremap <leader>y "ay
nnoremap <leader>p "ap
xnoremap <leader>p "ap
" reload vim
nnoremap <leader>rv :source ~/.vimrc<CR>

" ################################################
" moving between windows
" ################################################
" nnoremap <leader>w <C-w>
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l

" ################################################
" Command mode
" ################################################
cnoremap <C-p> <Up>
cnoremap <C-n> <down>
let g:terminal_color_4 = '#ff0000'
let g:terminal_color_5 = 'green'

" ################################################
" snippets
" ################################################
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" let g:UltiSnipsListSnippets="<leader>s"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ################################################
" Nerdtree
" ################################################
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-t> :NERDTreeFind<CR>

" ################################################
" TABS
" ################################################
" buffers 
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>ww :bd<CR>
" tabs
nnoremap <leader>w :tabclose<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt 
" move between number tabs
nnoremap <Leader>1 b1
nnoremap <Leader>2 b2
nnoremap <Leader>3 b3
nnoremap <Leader>4 b4
nnoremap <Leader>5 b5
nnoremap <Leader>6 b6
nnoremap <Leader>7 b7
nnoremap <Leader>8 b8
nnoremap <Leader>9 b9
" move between splits
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
" resize splits
nnoremap <Leader>+ :12winc +<CR>
nnoremap <Leader>_ :12winc -<CR>
nnoremap <Leader>= :12winc ><CR>
nnoremap <Leader>- :12winc <<CR>

" ################################################
" FZF 
" ################################################
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
let g:fzf_preview_window = []
" Global search 
map <C-F> :Ag<CR>

" ################################################
" airline integration 
" ################################################
syntax on
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
set background=dark
colorscheme gruvbox
autocmd ColorScheme * highlight! link SignColumn LineNr

" ################################################
" Git-gutter 
" ################################################
highlight GitGutterAdd    guifg=#85FF00 ctermfg=2
highlight GitGutterChange guifg=#fcb900 ctermfg=3
highlight GitGutterDelete guifg=#d0021b ctermfg=1
nmap <Leader>hr  <Plug>GitGutterRevertHunk
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)
nmap <leader>gf :GitGutterFold<CR>
nmap <leader>gd :GitGutterDiffOrig<CR>
nmap <leader>gu :GitGutterUndoHunk<CR>
nmap <Leader>gp :GitGutterPreviewHunk<CR>

" ###############################################
" RSPEC
" ###############################################
" To separate two commands use <bar>
map <Leader>rf :exe "!tmux send-keys -X -t 1 'cancel'"<CR><CR> <bar> :exe "!tmux send -t 1 'rspec " . expand('%:p') . "' Enter"<CR><CR>
map <Leader>rl :exe "!tmux send-keys -X -t 1 'cancel'"<CR><CR> <bar> :exe "!tmux send -t 1 'rspec " . expand('%:p') . ":" . line(".") . "' Enter"<CR><CR>
map <Leader>rk :exe "!tmux send-keys -X -t 1 'cancel'"<CR><CR> <bar> :exe "!tmux send -t 1 'rspec' Up Enter"<CR><CR>
map <Leader>rs :exe "!tmux send-keys -X -t 1 'cancel'"<CR><CR> <bar> :exe "!tmux send -t 1 'rails s' Enter"<CR><CR>
" map <Leader>rg :call RunAllSpecs()<CR>
let g:rspec_command = "!rspec --color {spec} "
let g:rspec_runner = "os_x_iterm2"

" ###############################################
" rails
" ###############################################
let g:rails_ctags_arguments = ['--languages=Ruby']
