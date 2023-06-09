" ################################################
" PLUGINS
" ################################################
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'https://github.com/airblade/vim-gitgutter.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'thoughtbot/vim-rspec'
  Plug 'https://github.com/tpope/vim-rails'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'morhetz/gruvbox'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'ngmy/vim-rubocop'
  Plug 'posva/vim-vue'
  Plug 'digitaltoad/vim-pug'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'edkolev/tmuxline.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors

" Set vsplit to the right
set splitright 

" set tabstop=2
set shiftwidth=2
set autoindent

" set clipboard=exclude:.*
nnoremap <expr> n 'Nn'[v:searchforward] . 'zz'
nnoremap <expr> N 'nN'[v:searchforward] . 'zz'
" Save file
" nnoremap <C-s> :w<CR>
set foldmethod=manual

" copying to leader
nnoremap <leader>y "ayy
xnoremap <leader>y "ay
nnoremap <leader>p "ap
xnoremap <leader>p "ap
" reload vim
nnoremap <leader>rv :source ~/.vimrc<CR>
" mouse functions
set mouse=a

" Custom commands
command! Dev :G checkout dev


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
let g:UltiSnipsExpandTrigger="<C-l>"
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
nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>
" Close buffer but not split
" b# -> change to previous buffer bd# -> delete previous buffer
" nnoremap <leader>ww :b#<bar>bd#<CR>
nnoremap <leader>ww :bd<CR>
nnoremap <leader>o :on<CR>
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
" nmap <silent> <leader>k :wincmd k<CR>
" nmap <silent> <leader>j :wincmd j<CR>
" nmap <silent> <leader>h :wincmd h<CR>
" nmap <silent> <leader>l :wincmd l<CR>
" resize splits
nnoremap <Leader>+ :12winc +<CR>
nnoremap <Leader>_ :12winc -<CR>
nnoremap <Leader>= :12winc ><CR>
nnoremap <Leader>- :12winc <<CR>

" ################################################
" FZF 
" ################################################
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
let g:fzf_preview_window = ['right,right,50%,<70(up,40%)', 'ctrl-/']
" Global search 
map <C-F> :Ag<CR>
map <leader>b :Buffers<CR>

" if exists('$TMUX')
"   let g:fzf_layout = { 'tmux': '-p90%,65%' }
" else
"   let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" endif
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ################################################
" airline integration 
" ################################################
syntax on
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybridline'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_section_b = '%{airline#extensions#branch#get_head()}'
" let g:airline_section_b = ''
let g:airline_section_y = 0

" ################################################
" grubox theme 
" ################################################
set background=dark
colorscheme gruvbox
autocmd ColorScheme * highlight! link SignColumn LineNr
let g:gruvbox_transparent_bg = 1 
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_guisp_fallback='bg'
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE

" ################################################
" Git-gutter 
" ################################################
highlight GitGutterAdd    guifg=#85FF00 ctermfg=2
highlight GitGutterChange guifg=#fcb900 ctermfg=3
highlight GitGutterDelete guifg=#d0021b ctermfg=1
" nmap <Leader>hr  <Plug>GitGutterRevertHunk
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)
nmap <leader>gf :GitGutterFold<CR>
nmap <leader>gd :GitGutterDiffOrig<CR>
nmap <leader>gu :GitGutterUndoHunk<CR>
nmap <Leader>gp :GitGutterPreviewHunk<CR>
nmap <Leader>gs :GitGutterStageHunk<CR>
let g:GitGutterLineNrHighlightsEnable = 1
let g:gitgutter_map_keys = 0

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
" Rubocop
" ###############################################
map <Leader>rc :!rubocop -a %<CR>

" ###############################################
" Prettier
" ###############################################
" map <Leader>rp :!yarn prettier --write %<CR><bar>:w<CR>
" map <Leader>rp :!yarn prettier --write %<CR>
nmap <Leader>rp :!yarn eslint --fix --format=codeframe --max-warnings=0 --ext js,vue,ts %<CR>
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"

" ###############################################
" rails
" ###############################################
let g:rails_ctags_arguments = ['--languages=Ruby']

" ###############################################
" COC for ruby 
" ###############################################
inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = ['coc-solargraph']
let g:coc_snippet_next = '<tab>'

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>

let g:tmuxline_preset = {
      \ 'a'    : ['#S'],
      \ 'b'    : ['#(gitmux -cfg $HOME/.gitmux.conf "#{pane_current_path}")'],
      \ 'win'  : '#I:#W#F',
      \ 'cwin' : '#I:#W#F',
      \ 'z'    : '%H:%M %d-%b-%y',
      \ 'x'    : '',
      \ 'options': {'status-justify': 'left'}
\}
