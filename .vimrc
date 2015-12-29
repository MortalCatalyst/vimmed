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
ActivateAddons neocomplete
ActivateAddons delimitMate
ActivateAddons virtualenv
ActivateAddons vim-rooter
ActivateAddons Emmet
ActivateAddons vim-autoformat
"ActivateAddons UltiSnips
ActivateAddons vim-snippets
ActivateAddons vim-darksea
ActivateAddons jellybeans
ActivateAddons neosnippet

let mapleader = ","
let g:unite_source_grep_command = 'ag'
nnoremap <Leader>f :Unite file<CR>


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
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
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

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
