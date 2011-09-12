"comment above, for input chinese word in vim
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

"窗口最大化
autocmd GUIEnter * simalt ~x

"命令行补全
set wildmenu

"自动括号补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap <a-j> <ESC>o
:inoremap <a-k> <ESC>O
:inoremap <a-e> <ESC>$a
:inoremap <a-q> <ESC>^i



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

" 在输入模式下移动光标，彻底抛弃方向键
inoremap <C-A-h> <left>
inoremap <C-A-j> <C-o>gms
inoremap <C-A-k> <C-o>gmw 
inoremap <C-A-l> <Right>
inoremap <M-h> <C-o>b
inoremap <M-l> <C-o>w
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

"映射长行上下移动快捷键
nmap j gj
nmap k gk

"改变窗口大小快捷键
nmap <up> <C-w>+10
nmap <down> <C-w>-10
nmap <left> <C-w>>10
nmap <right> <C-w><10
nmap <a-p> "+p

"映射系统剪贴板的复制和粘贴
vmap <A-y> "+y
vmap <A-p> "+p

" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=F:/Vim/dict/javascript.dict
autocmd filetype php set dictionary=F:/Vim/dict/php.dict
autocmd filetype html set dictionary=F:/Vim/dict/html.dict
autocmd filetype css set dictionary=F:/Vim/dict/css.dict


"选中状态下 Ctrl+c 复制
"vmap <C-c> "+y

"自动补全插件-neocomplcache
"let g:neocomplcache_enable_at_startup=1


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
