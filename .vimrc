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
set shiftwidth=4
set softtabstop=4

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
Plug 'zxqfl/tabnine-vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'theniceboy/bullets.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'  }
Plug 'iamcco/markdown-preview.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
call plug#end()
 
" augroup vimrc-incsearch-highlight
 "   autocmd!
 "   autocmd CmdlineEnter /,\? :set hlsearch
 "   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END

" setting for leader keymapping
let mapleader=','
let g:mapleader=','


"These are used for open vimrc and activate vimrc without exitingvim
nnoremap <leader>v :call OpenVimrc()<cr>
nnoremap <leader>a :source ~/.vimrc<cr>

" ====================================== "
" === Self defined keyboard shortcuts === "
" ====================================== "
map <F10> :NERDTreeToggle<CR>
nnoremap<F5>   :call PreviewHtml()<CR>
nnoremap <leader>w :w <cr>
map <space><CR> :nohlsearch<CR>
inoremap jj <esc>
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

" markdownPreview
nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

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


