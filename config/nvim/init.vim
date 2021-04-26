"Look and feel
syntax enable
set cursorline
set cursorcolumn
"set autoindent
set smartindent
" set title
set wrap
set hidden
"let &t_ut=''
set termguicolors
set number
"set relativenumber
set showmatch
set nocompatible
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab
set splitright
set splitbelow
set nobackup
set nowritebackup
"https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
set lazyredraw
set linebreak
set ruler
set equalalways

" We're using UTF-8 as file/script encoding
scriptencoding utf-8
set encoding=utf-8

" Use bash as shell (solve compatibility issues)
set shell=/bin/bash

" set completeopt=menu,menuone,preview,noselect,noinsert


"Also check out https://github.com/willfish/vimrc
"As well as https://gitlab.com/timvisee/dotfiles/blob/master/vim/vimrc
"set wildmenu

set backspace=indent,eol,start

let g:mapleader = ','

"if executable('node')
"let g:ale_disable_lsp = 1
"endif

set spelllang=en
" Disable spell checking, enable for some files
set nospell
autocmd FileType markdown,txt,text,tex,bib,gitcommit setlocal spell

" Highlight while searching, not after
set nohlsearch
set incsearch

" Live substitutions
if has('nvim')
    set inccommand=split
endif
" Always split fugitive diffs vertical
" set diffopt+=vertical



if !isdirectory($HOME . "/.vim_undo")
  silent call mkdir($HOME.'/.vim_undo', 'p', 0700)
endif

if isdirectory($HOME . "/.vim_undo")
  set undodir=~/.vim_undo
  set undofile
endif


if executable('git') && executable('curl')
  if empty(globpath(&rtp, 'autoload/plug.vim'))
    if has('nvim')
      !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    else
      !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    if exists("$MYVIMRC")
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif
endif

"if !empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
if !empty(globpath(&rtp, 'autoload/plug.vim'))
  "if empty(globpath(&rtp, 'autoload/plug.vim'))
  call plug#begin()
  "Look and feel
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/landscape.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'ryanoasis/vim-devicons'
  "NerdTree
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  "Completions
  " Plug 'tpope/vim-endwise'
  Plug 'jiangmiao/auto-pairs'
  "Go Config
  " if executable('go')
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "  endif
  Plug 'sebdah/vim-delve'
  "Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  "Ruby
  if executable('ruby')
    Plug 'vim-ruby/vim-ruby'
  endif
  "Lint
  Plug 'dense-analysis/ale'
  "Commenting
  Plug 'tpope/vim-commentary'
  "FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "Hashicorp Stuff
  if executable('terraform')
    Plug 'hashivim/vim-terraform'
    Plug 'juliosueiras/vim-terraform-completion'
    Plug 'juliosueiras/vim-terraform-snippets'
  endif
  if executable('packer')
    Plug 'hashivim/vim-packer'
  endif
  "Ansible
  if executable('ansible')
    Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
  endif
  "EditorConfig
  Plug 'editorconfig/editorconfig-vim'
  "Ack
  if executable('ack') || executable('ag')
    Plug 'mileszs/ack.vim'
  endif
  "HCL Formatting
  Plug 'fatih/vim-hclfmt'
  Plug 'jvirtanen/vim-hcl'
  "BATS
  Plug 'aliou/bats.vim'
  "Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'tpope/vim-surround'

  Plug 'tpope/vim-unimpaired'

  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  Plug 'andymass/vim-matchup'
  Plug 'machakann/vim-highlightedyank'
  Plug 'kshenoy/vim-signature'

  Plug 'glench/vim-jinja2-syntax'

  Plug 'knubie/vim-kitty-navigator'

  Plug 'direnv/direnv'

  Plug 'AndrewRadev/splitjoin.vim'
  " Plug 'plasticboy/vim-markdown'
  Plug 'vim-test/vim-test'
  Plug 'tpope/vim-dispatch'

  Plug 'dbakker/vim-projectroot'

  Plug 'cappyzawa/fly-lint.vim'

  " Plug 'numkil/ag.nvim'
  call plug#end()

  " Run PlugInstall if there are missing plugins
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    if exists("$MYVIMRC")
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif
endif

  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
try
  colorscheme OceanicNext

  catch
endtry
  let g:airline_theme='oceanicnext'

let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

"Set host progs
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

"Airline
"if exists(':AirlineExtensions')
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
"endif

"NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\..*\.sw[pom]$']
augroup NERD
 au!
  " autocmd VimEnter * NERDTree
  " autocmd VimEnter * wincmd p
augroup END


"Ale
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
" let g:go_fmt_command = "goimports"

let g:ale_list_window_size = 7
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
au BufRead,BufNewFile */*-ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */workstation/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */instant-api-ops/*.yml set filetype=yaml.ansible
let g:ansible_yamlKeyName = 'yamlKey'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['fixjson'],
\}

" Disable go linters as we are using gopls through LanguangeClient
let g:ale_linters = {
\'go': [''],
\}

let g:ale_yaml_yamllint_options = '-c '.projectroot#guess().'/.yamllint'

""LanguageClient - taken from https://github.com/neoclide/coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

"Terraform Formatting
let g:terraform_align=1
"let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
"
"HCL Formatting with vim-hclfmt
let g:hcl_fmt_autosave = 1
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0

map <Leader>rr :set makeprg=ruby\ %<cr>:make<cr>

au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Ansible
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_hightlight='d'
let g:ansible_extra_keywords_highlight = 1

" let g:markdown_fenced_languages = [
"       \ 'vim',
"       \ 'help'
"       \]

" nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
" nmap <silent> <leader>aj <Plug>(ale_next_wrap)

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"

nmap <F5> <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ 'terraform': ['terraform-ls', 'serve'],
    \ }
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" Cursor column toggle
nmap <silent> <leader>c :set cursorcolumn!<CR>
xmap <silent> <leader>c :set cursorcolumn!<CR>
" Sort selection
vmap <silent> S :sort<CR>
" Buffer close menu
"
au BufNewFile,BufRead /*.rasi setf css

" Vim/Kitty integration keymap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize window on splits - mostly needed for new kitty terminal windows
autocmd VimResized * wincmd =

" Vim-go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
" let g:go_metalinter_autosave = 1

" Status line types/signatures
let g:go_auto_type_info = 1
set autowrite
let g:go_list_type = "quickfix"
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_textobj_include_function_doc = 1

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"
let g:go_term_enabled = 1
" vim-test config
" set the default strategy to dispatch
" let test#strategy = "dispatch"
" Create key mapping
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Switch from insert mode to normal mode for neovim terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" let test#neovim#term_position = "topleft"
" let test#neovim#term_position = "vert"
" let test#neovim#term_position = "vert botright 30"

nmap <silent> <C-P> :Files<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
