set number
set relativenumber

" 禁用折叠代码
set nofoldenable

" 自动读取，自动保存
set autoread
set autowrite

" 补全列表
set wildmenu
set completeopt=preview,menu

" 高亮显示当前行
set cursorline

" 自动缩减
set cindent
set tabstop=4
set autoindent
set shiftwidth=2
set softtabstop=2

" 搜索
set hlsearch
set smartcase
set ignorecase

" 编码
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" select模式下显示选中的行数
set showcmd

" 显示文本上下保留行数
set scrolloff=10

" 开启256色支持
set t_Co=256

" use system clipboard
set clipboard=unnamedplus " yay -S xsel"
 
" 允许光标出现在最后一个字符的后面
set virtualedit=block,onemore

" 允许光标跨行
set whichwrap+=<,>,h,l

" 禁止自动换行
" set nowrap
" 光标闪烁
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  let $HOME='/home/lqf'
 " set paste

"pecify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'luochen1990/rainbow'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'voldikss/vim-translator'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug']  }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'html','javascript', 'css', 'less']  }
Plug 'liuchengxu/space-vim-dark'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" python

Plug 'tmhedberg/SimpylFold'
Plug 'tweekmonster/braceless.vim'
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" git
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" This to install ctags
Plug 'majutsushi/tagbar'
" This to install node
Plug 'suan/vim-instant-markdown'
" nerdtree font
Plug 'ryanoasis/vim-devicons'

call plug#end()
 
" augroup vimrc-incsearch-highlight
 "   autocmd!
 "   autocmd CmdlineEnter /,\? :set hlsearch
 "   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END

" setting for leader keymapping
let mapleader=','
let g:mapleader=','
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:user_emmet_leader_key='<C-Z>'
let g:rainbow_active = 1
" disable warning :"vim-go:iniialized gopls"
let g:go_gopls_enabled = 0
 "  go syntax-highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" autocmd vimenter * NERDTree
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
"aleplug
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\   'javascript': ['eslint'],
			\}



  let g:ale_fixers = {
  \   'javascript': [
  \       'DoSomething',
  \       'eslint',
  \       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
  \   ],
  \}

"These are used for open vimrc and activate vimrc without exitingvim
nnoremap <leader>v :call OpenVimrc()<cr>
nnoremap <leader>s :source ~/.vimrc<cr>


" ====================================== "
" === Self defined keyboard shortcuts === "
" ====================================== "
" au FileType go nmap <leader>r <Plug>(go-run)
map <space><CR> :nohlsearch<CR>
nnoremap mm :w<cr>
nnoremap<leader>. :q<cr>
nnoremap<C-t> :BTags<cr>
noremap q; :History: <cr>
inoremap kk <esc>
map <c-p> :FZF<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F6> :UndotreeToggle<cr>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" coc-explorer
nmap <space>t :CocCommand explorer<CR>
" ===
" === split
" ===
map su :set splitright<CR>:vsp<CR>
map si :set splitbelow<CR>:sp<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
map <space> viw

" easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
noremap Y "+y
" vim-translate
"der>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
map <Leader>r :call RunCode()<CR>
" =============================== "
" === Self defined funcations === "
" =============================== "

" function! PreviewHtml() 
" exec 'w'
" if &filetype == 'html'
" 	exec '!chromium %'
" endif
" endfunction

"settings for openvimrc
function! OpenVimrc()
	exec 'e ~/.vimrc'
endfunction

function! RunCode()
	exec "w"
set splitbelow
	if &filetype == 'python'
		" :!python3 %
		" :sp
		:terminal python3 %
	elseif &filetype == 'ruby'
	    :terminal ruby %
	elseif &filetype == 'html'
		 exec "!firefox % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'cpp'
		exec "!g++ % -Wall -o ./bin/%<"
		:sp
		:terminal ./bin/%<
	elseif &filetype == 'c'
		exec "!gcc % -Wall -o ./bin/%<"
		" !./bin/%<
		:sp
		:terminal ./bin/%<
	elseif &filetype == 'go'
		" :sp
		" :terminal go run %
		:GoRun<CR>
	elseif &filetype == 'java'
		exec "!find % -name '*.java' > temp"
		exec "!javac -cp ../bin -d ../bin/ @temp"
		exec "!rm temp"
	elseif &filetype == 'sh'
		:sp
		:terminal bash %
	endif
endfunction

" coc-see

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
