call plug#begin()
"Look and feel
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"NerdTree
"Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
"LanguangeServers
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Go Config
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Ruby
Plug 'vim-ruby/vim-ruby'
"Lint
Plug 'dense-analysis/ale'
"Plug 'neomake/neomake'
"Ctags
"Plug 'ludovicchabant/vim-gutentags'
"Commenting
Plug 'tpope/vim-commentary'
"FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"Terrform
Plug 'hashivim/vim-terraform'
"Ansible
Plug 'pearofducks/ansible-vim'

"OLD CONFIG
"Plug 'hashivim/vim-terraform'
"Plug 'neomake/neomake'
"Plug 'vim-syntastic/syntastic'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'juliosueiras/vim-terraform-completion'
"Plug 'zchee/deoplete-jedi'
"Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'tpope/vim-endwise'
"Plug 'jiangmiao/auto-pairs'
"Plug 'airblade/vim-gitgutter'
"Plug 'ervandew/supertab'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree'
"Plug 'micha/vim-colors-solarized'
"Plug 'w0rp/ale'
"Plug 'rhysd/vim-fixjson'
"Plug 'gabrielelana/vim-markdown'
"Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-hclfmt'
call plug#end()

"Set host progs
let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/bin/python3"
let g:ruby_host_prog = '~/.rbenv/versions/2.7.0/bin/neovim-ruby-host'

"Look and feel
syntax enable
set termguicolors
set number
set nocompatible
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

"Deoplete Completion
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Go Config
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | exe 'NERDTree' | endif
"autocmd vimenter * NERDTree
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END
let g:airline_theme='powerlineish'

set signcolumn=yes

"Ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:go_fmt_command = "goimports"

"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
let g:ale_list_window_size = 5
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['fixjson'],
\}

"Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"LanguageClient
"set hidden
"
"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
"
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"
"OLD CONFIG
"
""Syntastic Config
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"" (Optional)Remove Info(Preview) window
"set completeopt-=preview
"
"" (Optional)Hide Info(Preview) window after completions
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
"" (Optional) Enable terraform plan to be include in filter
"let g:syntastic_terraform_tffilter_plan = 1
"
"" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
"let g:terraform_completion_keys = 1
"
"" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
"let g:terraform_registry_module_completion = 0
"
""Deoplete Config
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
"call deoplete#custom#option('num_processes', 1)
"let g:deoplete#enable_at_startup = 1
"call deoplete#initialize()
"
""imap <C-k>     <Plug>(neosnippet_expand_or_jump)
""smap <C-k>     <Plug>(neosnippet_expand_or_jump)
""xmap <C-k>     <Plug>(neosnippet_expand_target)
"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <expr><TAB>
"" \ pumvisible() ? "\<C-n>" :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
"
"let g:SuperTabDefaultCompletionType = "<c-n>"
"
"" NERDTree
"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
""autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | exe 'NERDTree' | endif
""autocmd vimenter * NERDTree
"au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
""let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"augroup NERD
"    au!
"    autocmd VimEnter * NERDTree
"    autocmd VimEnter * wincmd p
"augroup END
"let g:airline_theme='powerlineish'
"
"set signcolumn=yes
"
"" Vim-go
"""https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1
"let g:go_snippet_engin = "neosnippet"
"" Error and warning signs.
"let g:ale_sign_error = '⤫'
"let g:ale_sign_warning = '⚠'
"" Enable integration with airline.
"let g:airline#extensions#ale#enabled = 1
"let g:go_fmt_command = "goimports"
"
""let g:ale_lint_on_save = 1
""let g:ale_lint_on_text_changed = 0
"let g:ale_list_window_size = 5
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
"" Set this if you want to.
"" This can be useful if you are combining ALE with
"" some other plugin which sets quickfix errors, etc.
"let g:ale_keep_list_window_open = 1
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'json': ['fixjson'],
"\}
"
"autocmd BufRead,BufNewFile *.hcl set filetype=terraform
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
"
"
"let g:go_version_warning = 0

map <Leader>rr :set makeprg=ruby\ %<cr>:make<cr>

au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

"au BufRead,BufNewFile */*-ansible/*.yml set filetype=yaml.ansible
"au BufRead,BufNewFile */workstation/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */*-ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */workstation/*.yml set filetype=yaml.ansible
let g:ansible_yamlKeyName = 'yamlKey'

let g:ale_list_window_size = 5
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1

let g:ale_keep_list_window_open = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['fixjson'],
\}
