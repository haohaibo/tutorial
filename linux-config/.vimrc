
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set number
set laststatus=2
set tags=tags;
set autochdir

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" 设置注释颜色
"hi Comment ctermfg =blue
"hi Comment ctermfg = darkyellow
"hi Comment ctermfg = white 
highlight Comment ctermfg=green guifg=green  

"去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
"解决backspace键不能用的问题
set backspace=indent,eol,start

"在屏幕右下角显示当前光标处位置
"set ruler
"使vim在输入字符串的过程中，光标就可定位显示匹配点
set incsearch

"设置C/C++方式自动对齐
set autoindent
set cindent



"开启语法高亮
syntax enable
syntax on

"设置在vim中可以使用鼠标
"set mouse=a

"检测文件类型
filetype on

"载入文件类型插件 
filetype plugin on 
"为特定文件类型载入相关缩进文件 
filetype indent on 


map <C-J> <C-X><C-I>

"使vim在输入字符串的过程中，光标就可定位显示匹配点
set incsearch


" 启动vim后自动打开taglist窗口
let Tlist_Auto_Open=1 

" taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow=1 

" 设置taglist窗口大小
let Tlist_WinWidth=20

" 设置taglist打开关闭快捷键F8
noremap <F8> :TlistToggle<CR>

" 定义折叠
set foldmethod=manual


"set cursorcolumn  "or set cuc 设置光标所在的列
set cursorline    "or set cul 设置光标所在的行
" cterm 表示原生vim设置央视, 设置为NONE表示可以自定义设置
" "
" red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫），
" " gray（灰），brown（棕），tan(褐色)，syan(青色)
" " 更多高亮颜色设置, 可以:h highlight 查看manual
" "highlight CursorLine   cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE
" guifg=NONE
" "highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE
" guifg=NONE


" 修改注释颜色
"hi Comment ctermfg =blue

"SET Comment START
autocmd BufNewFile *.php,*.js,*.cpp,*.c,*.cxx,*.cc,*.h,*.hpp,*.cu exec ":call SetComment()" |normal 10Go
 
func SetComment()
  "if expand("%:e") == 'php'
  "    call setline(1, "<?php")
  "elseif expand("%:e") == 'js'
  "    call setline(1, '//JavaScript file')
  "elseif expand("%:e") == 'cpp'
  "    call setline(1, '//C++ file')
  "endif

  call append(0, '/*')
  "call append(1, '*')
  "call append(2, '*      Filename: '.expand("%"))
  "call append(3, '*')
  call append(1, '* Author: Haibo Hao')
  call append(2, '* Email : haohaibo@ncic.ac.cn')
  "call append(, '*   Description: ---')
  "call append(7, '*        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
  "call append(8, '* Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
  call append(3, '* Copyright (C) 2017 NCIC')
  call append(4,'**/')

"    call append(10, '')
endfunc
map <F2> :call SetComment()<CR>:10<CR>o
"SET Comment END


"SET Last Modified Time START
func DataInsert()
    call cursor(9,1)
    if search ('Last Modified') != 0
        let line = line('.')
        call setline(line, '* Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc
autocmd FileWritePre,BufWritePre *.php,*.js,*.cpp ks|call DataInsert() |'s
"SET Last Modified Time END


" <F5> 编译和运行C++
map <F5> :call CompileRunGpp()<cr>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc

autocmd BufNewFile,BufRead *.cl set filetype=c
autocmd BufNewFile,BufRead *.sp3 set filetype=asm
autocmd BufNewFile,BufRead *.s set filetype=asm
