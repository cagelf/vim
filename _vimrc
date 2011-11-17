"配置中 inoremap 开头的表示后面的设置针对的是插入模式下的
"如 inoremap <a-c>w <ESC>ciw 表示的是在插入模式下按下 alt + c 后 按w
"删除光标下的单词
"<a-c>w 表示设置的按键 空格后面跟的表示要执行的操作 
" nnoremap  表示的是 正常模式下的设置
" vmap  表示的是 选择状态下的设置

"中文呢编码支持
set encoding=utf-8
"if !has("gui")
"    set termencoding=cp936
"endif
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
if has("win32") 
set fileencoding=utf-8 
else 
set fileencoding=utf-8 
endif 
"处理菜单及右键菜单乱码 
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 
"处理consle输出乱码 
language messages zh_CN.utf-8

set ambiwidth=double

"禁用vi兼容模式
set nocompatible

"让配置文件自动加载
autocmd! bufwritepost _vimrc source %

"配色方案
colorscheme slate
color molokai
set guifont=DejaVu\ Sans\ Mono:h11:cANSI

"默认区分大小写
set noignorecase

"设置冒号命令和搜索命令历史列表的长度
set history =1000

"设定在任何模式下鼠标都可用
set mouse=

"设置命令行的高度为1
set cmdheight=1

"设置状态栏标尺
set ruler

"设定退格键和delete键
set backspace=indent,eol,start

"输入搜索内容时就显示搜索结果
set incsearch
set nohls

"搜索结果高亮显示
set hlsearch

"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase

"高亮显示当前行
set cursorline

"tab宽度为四个字符
set tabstop=4
set expandtab

"开启新行时自动智能缩进
set smartindent
set shiftwidth=4

"设置自动缩进
"set autoindent

"自动识别文件类型
filetype on
filetype plugin on
filetype plugin indent on

"在状态栏显示目前所执行的指令，未完成的指令片段也会显示出来
set showcmd

"显示行号
set number

"关闭备份
set nobackup

"设置匹配模式
set showmatch

"显示光标的状态行
set guioptions-=T


"开始折叠
set foldenable
set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"语法高亮
syntax enable
syntax on

"设置tags
set tags=tags;
set autochdir

"设置taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=1
let Tlist_File_Fold_Auto_Colse=1
let Tlist_Process_File_Always=1

"文件目录窗口
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:AutoOpenWinManager=1

"多文件编辑
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapCTabSwitchWindows=1
let g:miniBufExplorerMoreThanOne=1

"打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"打开javascript折叠
let b:javascript_fold=1

"窗口最大化,只适合windows
autocmd GUIEnter * simalt ~x

"命令行补全
set wildmenu

"自动括号补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap <a-j> <ESC>o
inoremap <a-k> <ESC>O
inoremap <a-e> <ESC>$a
inoremap <a-q> <ESC>^i

" 在输入模式下移动光标，彻底抛弃方向键
inoremap <a-a> <left>
inoremap <a-d> <right>
inoremap <a-w> <ESC>gka
inoremap <a-s> <ESC>gja
inoremap <a-c> <ESC>ci
inoremap <a-c>d <ESC>cc
inoremap <a-c>w <ESC>ciw
inoremap <a-c>t <ESC>cit
inoremap <a-c>< <ESC>ci<
inoremap <a-c>" <ESC>ci"
inoremap <a-c>' <ESC>ci'
inoremap <a-c>{ <ESC>ci{
inoremap <a-c>[ <ESC>ci[
inoremap <a-c>( <ESC>ci(
inoremap <a-y> <ESC>yi
inoremap <a-y>l <ESC>yya
inoremap <a-y>w <ESC>yiw
inoremap <a-y>t <ESC>yit
inoremap <a-y>< <ESC>yi<
inoremap <a-y>" <ESC>yi"
inoremap <a-y>' <ESC>yi'
inoremap <a-y>{ <ESC>yi{
inoremap <a-y>[ <ESC>yi[
inoremap <a-y>( <ESC>yi(
inoremap <a-p> <ESC>pa
inoremap <a-v> <ESC>"+pa
inoremap <a-u> <ESC>ua
inoremap <a-r> <ESC><c-r>a
inoremap <a-l> <ESC>wa
inoremap <a-h> <ESC>ba
inoremap <a-f> <ESC>:w<cr>a
inoremap <a-o> <ESC>gkJa
inoremap <a-m> <ESC>ld$a
inoremap <a-n> <ESC>ld^i
inoremap <c-k> <c-x><c-k>
inoremap <c-f> <c-x><c-f>
inoremap <a-i> <c-y>
inoremap <a-,> <c-w>

"实现括号的自动配对后防止重复输入），适用python
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

"显示状态栏
set laststatus=2

"状态栏显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

"映射长行上下移动快捷键
nmap j gj
nmap k gk

"改变窗口大小快捷键
nmap <a-k> <C-w>+10
nmap <a-j> <C-w>-10
nmap <a-h> <C-w>>10
nmap <a-l> <C-w><10
nmap <a-p> "+p

"正常模式下窗口切换
nmap <a-w> <c-w>k
nmap <a-d> <c-w>l
nmap <a-s> <c-w>j
nmap <a-a> <c-w>h
nmap <a-\> <c-w>>1000

"跳到行尾和行首
nmap <a-q> I
nmap <a-e> A
nmap <a-n> ^
nmap <a-m> $
nmap <a-i> zR

"映射ct快捷键
nmap <a-x> <c-v>
nmap <a-y> "+
nmap <a-v> V
nmap <a-g> G
nmap d<a-g> dG
nmap d<a-n> d^
nmap d<a-m> d$
nmap d<a--> df
nmap d<a-b> dF
nmap <a-8> *
nmap <a-5> %
nmap <a-t> V\5
nmap <a-o> \5
nmap <tab> <s-c-tab>

"注释快捷键
nmap <a-c> \cc
nmap <a-r> \cu
vmap <a-r> \cu
vmap <a-c> \cs
vmap <a-b> \cm
vmap <a-n> ^
vmap <a-m> $
vmap <a-g> G
vmap <a-o> \5

"块级插入时有用
vmap <a-q> I
vmap <a-e> A
vmap <a-f> F

"重复find操作
nmap , ;
vmap , ;

"映射系统剪贴板的复制和粘贴
vmap <A-y> "+y
vmap <A-p> "+p

"选中状态下移动单行
vmap j gj
vmap k gk

" 让 Tohtml 产生有 CSS 语法的 html
let html_use_css=1

" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=F:/Vim/dict/javascript.dict
autocmd filetype php set dictionary=F:/Vim/dict/php.dict
autocmd filetype html set dictionary=F:/Vim/dict/html.dict
autocmd filetype css set dictionary=F:/Vim/dict/css.dict

"选中状态下 Ctrl+c 复制
"vmap <C-c> "+y

"jquery的语法高亮
au BufRead,BufNewFile *.js set filetype=javascript syntax=jquery

"自动补全插件-neocomplcache
"let g:neocomplcache_enable_at_startup=1

"隐藏垂直方向滚动条"
if has("gui_running")
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
endif

"菜单栏隐藏与显示切换
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"html标签自动补全
function! InsertHtmlTag()
        let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
        normal! a>
        let save_cursor = getpos('.')
        let result = matchstr(getline(save_cursor[1]), pat)
        if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>','bn',0,  getline('.')) > 0)
        "if (search(pat, 'b', save_cursor[1]))
           normal! lyiwf>
           normal! a</
           normal! p
           normal! a>
        endif
        :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
		inoremap > <ESC>:call InsertHtmlTag()<CR>a 
