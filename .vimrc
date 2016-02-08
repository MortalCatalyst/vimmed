" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = {
		\'shell_commands_run_method': 'system',
    		\'auto_install': 1,
    		\'log_to_buf': 1,
		\}
	let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
	let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
	" let g:vim_addon_manager = { your config here see "commented version" example and help
	if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
		execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
					\       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
	endif
	call vam#ActivateAddons([])
	" Also See "plugins-per-line" below
endfun
call SetupVAM()
ActivateAddons fugitive
ActivateAddons vim-task
ActivateAddons vim-gitgutter
ActivateAddons vim-airline
ActivateAddons EasyMotion
ActivateAddons Syntastic
ActivateAddons trailing-whitespace
ActivateAddons css_color_preview
ActivateAddons vim-css3-syntax
ActivateAddons delimitMate
ActivateAddons virtualenv
ActivateAddons vim-rooter
ActivateAddons Emmet
ActivateAddons vim-autoformat
ActivateAddons UltiSnips
ActivateAddons vim-snippets
ActivateAddons YouCompleteMe
ActivateAddons vim-autopep8
ActivateAddons Supertab
ActivateAddons surround
ActivateAddons vimproc
ActivateAddons ag
ActivateAddons vim-django
ActivateAddons SimpylFold
call vam#ActivateAddons(['github:hynek/vim-python-pep8-indent'])
call vam#ActivateAddons(['github:elzr/vim-json'])
call vam#ActivateAddons(['github:actionshrimp/vim-xpath'])
call vam#ActivateAddons(['github:jeroenp/vim-xquery-syntax'])
call vam#ActivateAddons(['github:sukima/xmledit'])
call vam#ActivateAddons(['github:jeetsukumaran/vim-buffergator'])
call vam#ActivateAddons(['github:NLKNguyen/papercolor-theme'])
call vam#ActivateAddons(['github:scrooloose/nerdcommenter'])
call vam#ActivateAddons(['github:jeetsukumaran/vim-buffergator'])
call vam#ActivateAddons(['github:kien/ctrlp.vim'])

au BufEnter *.css set nocindent
au BufLeave *.css set autoindent
let mapleader = ","

"nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set tabstop=4
set shiftwidth=4
set expandtab

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" splits
set splitbelow
set splitright

if has("gui_running")
	set lines=45 columns=110
    set guioptions-=T  " no toolbar
	set t_Co=256 
    set background=dark 
    colorscheme PaperColor
    set number
else
	if exists("+lines")
		set t_Co=256
        set background=dark
        colorscheme PaperColor
        set number
        set laststatus=2
        set lines=40
	endif
	if exists("+columns")
		set columns=120
	endif
	if &diff
		let &columns = ((&columns*2 > 240)? 240: &columns*2)
	endif
endif

syntax on
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set showcmd
set incsearch
set mouse=a
set completeopt=menu,menuone,longest
set pumheight=15
set wildmenu
" from https://github.com/bling/dotvim/blob/master/vimrc

set timeoutlen=300                                  "mapping timeout
set ttimeoutlen=50                                  "keycode timeout

set mouse=a                                         "enable mouse
set mousehide                                       "hide when characters are typed
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
set encoding=utf-8                                  "set encoding for text


set hidden                                          "allow buffer switching without saving
set autoread                                        "auto reload if file saved externally
set fileformats+=mac                                "add mac to auto-detection of file format line endings
set nrformats-=octal                                "always assume decimal numbers
set showcmd
set tags=tags;/
set showfulltag
set modeline
set modelines=5
" whitespace
set backspace=indent,eol,start                      "allow backspacing everything in insert mode
set autoindent                                      "automatically indent to match adjacent lines
set expandtab                                       "spaces instead of tabs
set smarttab                                        "use shiftwidth to enter tabs
set scrolloff=1                                     "always show content after scroll
set scrolljump=5                                    "minimum number of lines to scroll
set display+=lastline
set wildmenu                                        "show list for autocomplete
set wildmode=list:full
set wildignorecase

set noswapfile
set splitbelow
set splitright
set showmatch                                       "automatically highlight matching braces/brackets/etc.
set matchtime=2                                     "tens of a second to show matching parentheses
set number

set clipboard=unnamed
" smash escape
inoremap jk <esc>
inoremap kj <esc>

" change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
"Pydiction
"let g:pydiction_location = '/home/sayth/.vim/vim-addons/Pydiction/complete-dict'
"let g:pydiction_menu_height = 3
" django settings
let g:django_projects = '~/Projects' "Sets all projects under project
let g:django_activate_virtualenv = 1 "Try to activate the associated virtualenv
let g:django_activate_nerdtree = 1 "Try to open nerdtree at the project root.

autocmd FileType js,scss,css autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
autocmd FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal nolist
autocmd FileType vim setlocal fdm=indent keywordprg=:help


" Setup some default ignores
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

"  buffergator
"- Use `<Leader>b` (typically: `\b`) to open a window listing all buffers. In this
   " window, you can use normal movement keys to select a buffer and then:
   " - <ENTER> to edit the selected buffer in the previous window
   " - <C-V> to edit the selected buffer in a new vertical split
   " - <C-S> to edit the selected buffer in a new horizontal split
   " - <C-T> to edit the selected buffer in a new tab page
 View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"" unite
"call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#profile('default', 'context.smartcase', 1)
"call unite#custom#profile('default', 'context.ignorecase', 1)
"let g:unite_prompt = '» '
"let g:unite_source_history_yank_enable = 1

"if executable('ag')
    "let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    "let g:unite_source_grep_command = 'ag'
    "let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    "let g:unite_source_grep_recursive_opt=''
"endif
"let g:unite_source_rec_max_cache_files=5000


"nnoremap <space>s :Unite -quick-match buffer<cr>

"nnoremap <Space>p :Unite -start-insert -no-split -no-resize file_rec/async<cr>
"nnoremap <Space>f :Unite -start-insert -no-split -no-resize file file/new directory/new<cr>
"nnoremap <Space>b :Unite -start-insert -no-split -no-resize buffer<cr>
"nnoremap <Space>y :Unite -start-insert -no-split -no-resize history/yank<cr>
"nnoremap <Space>o :Unite -start-insert -no-split -no-resize outline<cr>
"nnoremap <Space>/ :Unite -start-insert -no-split -no-resize grep:.<cr>

imap <expr> <C-Z> emmet#expandAbbrIntelligent("\<C-Z>")
" make YCM compatible with Ultisnips
" http://stackoverflow.com/a/22253548/461887
" ultisnips

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" Syntastic
let g:syntastic_python_pylint_args='-d E0602 -f parseable -r n -i y'
let g:syntastic_python_pylint_args='-d E1601 -f parseable -r n -i y'
" copy and paste
set clipboard+=unnamedplus  " use the clipboards of vim and win
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
"
" " easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
"
map  / <Plug>(easymotion-sn)
map / <Plug>(easymotion-tn)
"
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
"
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
"
let g:syntastic_javascript_checkers = ['jscs']

noremap <F3> :Autoformat<CR>

nmap <F8> :TagbarToggle<CR>
let g:ConqueTerm_CloseOnEnd = 1
let g:sneak#streak = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
" " syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,jquery,handlebars'
" " klen python-mode
" " Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<C-]>"
" "
" " " Override run current python file key shortcut to Ctrl-Shift-e
"let g:pymode_run_bind = "<C-S-e>"
" "
" " " Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc_bind = "<C-S-d>"
" turn off pylint unless toggled
"let g:pymode_lint_write = 0       "turn off running pylint on file save
"nnoremap <leader>p :PyLint<cr>    "pressing ,p will run plyint on current buffer
" let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length})
"let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
"let g:pymode_lint_options_mccabe = { 'complexity': 12 }

" https://github.com/airblade/vim-rooter
"let g:rooter_autocmd_patterns = '*.git,*.js'

"let g:acp_enableAtStartup = 0
