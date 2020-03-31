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

  let $HOME='/home/mofeng'
 " set paste

"pecify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'zxqfl/tabnine-vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mattn/emmet-vim'
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
let mapleader=';'
let g:mapleader=';'
let g:rainbow_active = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
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
nnoremap <leader>a :source ~/.vimrc<cr>

" ====================================== "
" === Self defined keyboard shortcuts === "
" ====================================== "
map <C-n> :NERDTreeToggle<CR>
nnoremap<F5>   :call PreviewHtml()<CR>
map <space><CR> :nohlsearch<CR>
nnoremap<leader>m :w<cr>
inoremap kk <esc>
map <c-p> :FZF<CR>
nmap <F8> :TagbarToggle<CR>
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

" =============================== "
" === Self defined funcations === "
" =============================== "

function! PreviewHtml() 
exec 'w'
if &filetype == 'html'
	exec '!chromium %'
endif
endfunction

"settings for openvimrc
function! OpenVimrc()
	exec 'e ~/.vimrc'
endfunction


