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
call vam#ActivateAddons(['github:davidhalter/jedi-vim'])
call vam#ActivateAddons(['github:chrisbra/csv.vim'])
" call vam#ActivateAddons(['github:mileszs/ack.vim'])
call vam#ActivateAddons(['github:vim-scripts/dbext.vim'])
call vam#ActivateAddons(['github:Glench/Vim-Jinja2-Syntax'])
call vam#ActivateAddons(['github:lepture/vim-jinja'])
au BufEnter *.css set nocindent
au BufLeave *.css set autoindent
let mapleader = ","

"nerdtree
"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
	set lines=45 columns=86
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
		set columns=86
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
" set backspace=indent,eol,start                      "allow backspacing everything in insert mode
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

" smash escape
inoremap jk <esc>
inoremap kj <esc>

" change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
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

"jedi
let g:jedi#use_tabs_not_buffers = 1
" don't see docstring
autocmd FileType python setlocal completeopt-=preview

" simplyFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

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

"" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" ack.vim ag fallback
"if executable('ag')
""  let g:ackprg = 'ag --vimgrep'
"endif

" let g:ackprg = 'ag --nogroup --nocolor --column'
" ag
let g:ag_working_path_mode="r"

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

" dbext
 augroup project1
         au!
         " Automatically choose the correct dbext profile
         autocmd BufRead */projectX/sql/* DBSetOption profile=myASA
     augroup end

     augroup project2
         au!
         " Automatically choose the correct dbext profile
         autocmd BufRead */projectY/* DBSetOption profile=myORA
     augroup end
" Fix backsapce and delete http://vim.wikia.com/wiki/Backspace_and_delete_problemsv
:fixdel

" trim trailing whitespace on save http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

" Map run python to F5i http://vim.wikia.com/wiki/Python_-_check_syntax_and_run_script and http://stackoverflow.com/a/12524133/461887
nnoremap <silent> <F5> :!python %<CR>

" make html files featre jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
