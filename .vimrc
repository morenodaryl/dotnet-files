" " ################################################
" " PLUGINS
" " ################################################
" call plug#begin()
"   Plug 'ryanoasis/vim-devicons'
"   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"   Plug 'junegunn/fzf.vim'
"   Plug 'vim-airline/vim-airline'
"   Plug 'vim-airline/vim-airline-themes'
"   Plug 'mattn/emmet-vim'
"   Plug 'https://github.com/airblade/vim-gitgutter.git'
"   Plug 'https://github.com/tpope/vim-fugitive.git'
"   Plug 'https://github.com/tpope/vim-surround.git'
"   Plug 'https://github.com/tpope/vim-rails'
"   Plug 'https://github.com/tpope/vim-commentary'
"   Plug 'morhetz/gruvbox'
"   Plug 'SirVer/ultisnips'
"   Plug 'honza/vim-snippets'
"   Plug 'editorconfig/editorconfig-vim'
"   Plug 'posva/vim-vue'
"   Plug 'digitaltoad/vim-pug'
"   Plug 'christoomey/vim-tmux-navigator'
"   Plug 'edkolev/tmuxline.vim'
"   Plug 'wakatime/vim-wakatime'
"   Plug 'preservim/nerdtree'
" call plug#end()
"
" let mapleader=" " 
" nnoremap <SPACE> <Nop>
" " ################################################
" " CUSTOM VIM SETTINGS
" " ################################################
" inoremap jk <ESC>
" :set number relativenumber
" " :set number norelativenumber
" :hi LineNr ctermfg=4
" set hlsearch
" set incsearch
" set ignorecase
" set smartcase
" set nowrap
" set clipboard=unnamed
"
" " set t_8f=\[[38;2;%lu;%lu;%lum
" " set t_8b=\[[48;2;%lu;%lu;%lum
" set termguicolors
"
" " Set vsplit to the right
" set splitright 
"
" " set tabstop=2
" set shiftwidth=2
" set autoindent
"
" " set clipboard=exclude:.*
" nnoremap <expr> n 'Nn'[v:searchforward] . 'zz'
" nnoremap <expr> N 'nN'[v:searchforward] . 'zz'
" " Save file
" " nnoremap <C-s> :w<CR>
" set foldmethod=manual
"
" " copying to leader
" nnoremap <leader>y "ayy
" xnoremap <leader>y "ay
" nnoremap <leader>p "ap
" xnoremap <leader>p "ap
"
" " reload vim
" nnoremap <leader>rv :source ~/.config/nvim/init.lua<CR>
"
" " Comments fir .vue files
" autocmd FileType vue setlocal commentstring=//\ %s
" autocmd FileType vue setlocal formatprg=vetur
"
" " ###############################################
" " COPILOT 
" " ###############################################
" imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
" imap <silent><C-k> <Plug>(copilot-next)
" imap <silent><C-j> <Plug>(copilot-previous)
" imap <silent><C-h> <Plug>(copilot-suggest)
" nmap <leader>rn <Plug>(coc-rename)
" let g:copilot_no_tab_map = v:true
"
" " ################################################
" " Command mode
" " ################################################
" cnoremap <C-p> <Up>
" cnoremap <C-n> <down>
"
" " ################################################
" " snippets
" " ################################################
" " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" " - https://github.com/Valloric/YouCompleteMe
" " - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<C-l>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" " let g:UltiSnipsListSnippets="<leader>s"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" " ################################################
" " Nerdtree
" " ################################################
" nnoremap <leader>n :NERDTreeFind<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" " nnoremap <C-t> :NERDTreeFind<CR>
"
" " ################################################
" " TABS BUFFERS
" " ################################################
" nnoremap <leader>k :bn<CR>
" nnoremap <leader>j :bp<CR>
" nnoremap <leader>o :on<CR>
" " tabs
" nnoremap <leader>w :tabclose<CR>
" nnoremap <C-h> gT
" nnoremap <C-l> gt 
" " move between number tabs
" nnoremap <Leader>1 b1
" nnoremap <Leader>2 b2
" nnoremap <Leader>3 b3
" nnoremap <Leader>4 b4
" nnoremap <Leader>5 b5
" nnoremap <Leader>6 b6
" nnoremap <Leader>7 b7
" nnoremap <Leader>8 b8
" nnoremap <Leader>9 b9
" " resize splits
" nnoremap <Leader>+ :12winc +<CR>
" nnoremap <Leader>_ :12winc -<CR>
" nnoremap <Leader>= :12winc ><CR>
" nnoremap <Leader>- :12winc <<CR>
"
" " ################################################
" " FZF 
" " ################################################
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" let g:fzf_preview_window = ['right,right,50%,<70(up,50%)', 'ctrl-/']
"
" let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7 } }
" " Global search 
" map <C-F> :Ag<CR>
" map <leader>b :Buffers<CR>
" map <leader>gh :BCommits<CR>
"
" " if exists('$TMUX')
" "   let g:fzf_layout = { 'tmux': '-p90%,65%' }
" " else
" "   let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" " endif
" let g:fzf_history_dir = '~/.local/share/fzf-history'
"
" " ################################################
" " airline integration 
" " ################################################
" syntax on
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#buffer_nr_show=1
" let g:airline#extensions#branch#enabled=1
" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_section_y = 0
" let g:airline_section_z = '%l:%c'
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.branch = '🛠️'
" let g:airline_symbols.dirty='⚡️'
"
" let g:airline_mode_map = {
"       \ 'c'      : 'C',
"       \ 'i'      : 'I',
"       \ 'ic'     : 'I',
"       \ 'ix'     : 'I',
"       \ 'n'      : 'N',
"       \ 'ni'     : 'N',
"       \ 'no'     : 'N',
"       \ }
"
" " next line modifies NORMAL mode to show only N and not -- NORMAL --
"
" " ################################################
" " grubox theme 
" " ################################################
" set background=dark
" colorscheme gruvbox
" autocmd ColorScheme * highlight! link SignColumn LineNr
" let g:gruvbox_transparent_bg = 1 
" let g:gruvbox_contrast_dark='soft'
" let g:gruvbox_guisp_fallback='bg'
" hi NonText ctermbg=none
" hi Normal guibg=NONE ctermbg=NONE
"
" " ################################################
" " Git-gutter 
" " ################################################
" highlight GitGutterAdd    guifg=#85FF00 ctermfg=2
" highlight GitGutterChange guifg=#fcb900 ctermfg=3
" highlight GitGutterDelete guifg=#d0021b ctermfg=1
" " nmap <Leader>hr  <Plug>GitGutterRevertHunk
" nmap <leader>] <Plug>(GitGutterNextHunk)
" nmap <leader>[ <Plug>(GitGutterPrevHunk)
" nmap <leader>gf :GitGutterFold<CR>
" nmap <leader>gd :GitGutterDiffOrig<CR>
" nmap <leader>gu :GitGutterUndoHunk<CR>
" nmap <Leader>gp :GitGutterPreviewHunk<CR>
" nmap <Leader>gs :GitGutterStageHunk<CR>
" let g:GitGutterLineNrHighlightsEnable = 1
" let g:gitgutter_map_keys = 0
"
" " ###############################################
" " RSPEC TMUX KEYBINDING
" " ###############################################
" " To separate two commands use <bar>
"
" " let g:my_tmux_gargetsession_name:window_nass.pane_number
" " let g:my_tmux_target = "1" " panel 1 of current windopw
" let g:my_tmux_target = "DS:testing.0" 
" map <silent><Leader>rf :exe "!tmux send-keys -X -t " . g:my_tmux_target . " 'cancel'"<CR><CR> <bar> :exe "!tmux send -t " . g:my_tmux_target . " 'rspec " . expand('%:p') . " -f p' Enter"<CR><CR>
" map <silent><Leader>rl :exe "!tmux send-keys -X -t " . g:my_tmux_target . " 'cancel'"<CR><CR> <bar> :exe "!tmux send -t " . g:my_tmux_target . " 'rspec " . expand('%:p') . ":" . line(".") . " -f d' Enter"<CR><CR>
" map <silent><Leader>rk :exe "!tmux send-keys -X -t " . g:my_tmux_target . " 'cancel'"<CR><CR> <bar> :exe "!tmux send -t " . g:my_tmux_target . " 'rspec ' Up Enter"<CR><CR>
" map <silent><Leader>rq :exe "!tmux send -t " . g:my_tmux_target . " 'exit-program' Enter"<CR><CR>
" map <silent><Leader>ry :exe "!tmux send -t 2.0 'yarn serve' Enter"<CR><CR>
" map <silent><Leader>rs :exe "!tmux send -t 3.0 'rails s' Enter"<CR><CR>
"
" " ###############################################
" " Rubocop KEYBINDING
" " ###############################################
" map <Leader>rc :!rubocop -a %<CR>
" " NOTE: below if you want to have it in another pane
" " nmap <Leader>rc :exe "!tmux send-keys -X -t 1 'cancel'"<CR><CR> <bar> :exe "!tmux send -t 1 'rubocop -a " . expand('%:p') . "' Enter"<CR><CR>
"
" " ###############################################
" " Prettier KEYBINDING
" " ###############################################
" nmap <Leader>rp :!yarn eslint --fix --format=codeframe --max-warnings=0 --ext js,vue,ts %<CR>
"
" " ###############################################
" " rails
" " ###############################################
" let g:rails_ctags_arguments = ['--languages=Ruby']
"
" " ###############################################
" " TMUX navigator 
" " ###############################################
" let g:tmux_navigator_no_mappings = 1
" let g:tmux_navigator_disable_when_zoomed = 1
"
" noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
" noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
" noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
" noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
"
" " let g:tmuxline_theme = 'jellybeans'
" " let g:tmuxline_preset = 'full'
" let g:tmuxline_preset = {
"       \ 'a'    : ['#S'],
"       \ 'win'  : '#I:#W#F',
"       \ 'cwin' : '#I:#W#F',
"       \ 'z'    : '#{weather} %H:%M %d-%b-%y',
"       \ 'options': {'status-justify': 'center'}
" \}
"
" " ###############################################
" " COC 
" " ###############################################
" inoremap <silent><expr> <tab>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gD <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>qf <Plug>(coc-fix-current) 
"
" xmap <silent><leader>a  <Plug>(coc-codeaction-cursor)
" nmap <silent><leader>a  <Plug>(coc-codeaction-selected)
" inoremap <silent><expr><C-s> coc#refresh()
"
" nmap <leader>qd :CocDiagnostics<cr>
" vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
"
" let g:coc_snippet_next = '<tab>'
" let g:coc_global_extensions = ['coc-solargraph']
" let g:coc_snippet_next = '<tab>'
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
