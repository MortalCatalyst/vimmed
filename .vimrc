" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
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
ActivateAddons Python-mode-klen
ActivateAddons unite
ActivateAddons fugitive
ActivateAddons vim-task
ActivateAddons vim-gitgutter
ActivateAddons vim-airline
ActivateAddons EasyMotion
ActivateAddons Syntastic
ActivateAddons trailing-whitespace
ActivateAddons 256-jungle
ActivateAddons css_color_preview
"ActivateAddons neocomplete
ActivateAddons delimitMate
ActivateAddons virtualenv
ActivateAddons vim-rooter
ActivateAddons Emmet
ActivateAddons vim-autoformat
ActivateAddons UltiSnips
ActivateAddons vim-snippets
ActivateAddons vim-darksea
ActivateAddons jellybeans
"ActivateAddons neosnippet
ActivateAddons YouCompleteMe
ActivateAddons vim-autopep8
ActivateAddons Supertab
ActivateAddons surround

let mapleader = ","
let g:unite_source_grep_command = 'ag'
nnoremap <Leader>f :Unite file<CR>

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" splits
set splitbelow
set splitright

if has("gui_running")
	set lines=50 columns=120
        set guioptions-=T  " no toolbar
	colorscheme jellybeans 
else
	if exists("+lines")
		colorscheme 256-jungle
		set lines=40
	endif
	if exists("+columns")
		set columns=80
	endif
	if &diff
		let &columns = ((&columns*2 > 240)? 240: &columns*2)
	endif
endif

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
"
autocmd VimEnter * wincmd p
"
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


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
let g:pymode_rope_goto_definition_bind = "<C-]>"
" "
" " " Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" "
" " " Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" https://github.com/airblade/vim-rooter
let g:rooter_autocmd_patterns = '*.git,*.js'

let g:acp_enableAtStartup = 0
