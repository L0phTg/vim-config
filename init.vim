set nu

let mapleader= ' '
let g:mapleader = ' '

syntax on

filetype on

filetype indent on

filetype plugin on

filetype plugin indent on

" 标签页
set tabpagemax=20
set showtabline=2

" 设置文件浏览器目录为当前目录
set bsdir=buffer


" 突出显示当前行
set cursorline

" 突出显示当前列
" set cursorcolumn

" 鼠标暂不启用
" set mouse-=a
" 启用鼠标
" set mouse=a

" 括号配对情况, 跳转并高亮匹配的括号
set showmatch
"
set matchtime=2

" 相对行号: 行号变成相对
set relativenumber number

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
" set helplang=cn

set rtp+=~/.fzf                  " fzf

" 配置python路径
let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.8'

" 设置path, vim中会索引
" set path+=/usr/include/c++/9/,/usr/local/include/,
" set path+=/usr/include/clang/12/include/,
set path+=/usr/include/python3.7
set path+=/usr/local/cuda-11.7/include
set path+=/usr/include/c++/9,/usr/include,/home/l0phtg/removable/work-git/llvm-project/llvm/include

" 记录光标位置
"augroup resCur

"nmap 

"set background=dark

"plug插件
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
"Plug 'NLKNguyen/papercolor-theme'   弃用
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'         "状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight' "cpp 语法高亮

Plug 'tpope/vim-fugitive'   "airline status 显示分支

Plug 'Shougo/denite.nvim'    " fuzzy finder 
"
Plug 'ryanoasis/vim-devicons'   " vim icons

Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}   " 目录
Plug 'kristijanhusak/defx-icons'  " icons for defx
"Plug 'kristijanhusak/defx-git'    " git for defx  一般不怎么需要
"
"Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   "异步补全
Plug 'Shougo/neoinclude.vim' "c 头文件补全
Plug 'Shougo/neco-syntax'    "关键字补全 keyword
" Plug 'deoplete-plugins/deoplete-clang'
Plug 'Shougo/deoplete-clangx' " clang complete for deoplete
" Plug 'deoplete-plugins/deoplete-jedi'       " Python补全
Plug 'Shougo/echodoc'

Plug 'majutsushi/tagbar'   " tag显示
Plug 'ap/vim-buftabline'   " buffer

" Supertab
Plug 'ervandew/supertab'   " 映射其他键为tab, 我们用于解决ultisnips和deoplete的补全冲突

" 补全: https://keelii.com/2018/08/26/vim-plugin-ultisnips-advanced-tips/
Plug 'SirVer/ultisnips'           " 代码补全插件
Plug 'honza/vim-snippets'		  " 补全片段 follow ultisnips
"

Plug 'Raimondi/delimitMate'       " 补全, \" \( 等.

Plug 'scrooloose/nerdcommenter'   " 自动注释   <leader>cc  注释当先选中文本  <leader>cu 取消选中文本块的注释

Plug 'lvht/tagbar-markdown'       " markdown  tagbar显示

Plug 'pboettch/vim-cmake-syntax'  " cmake语法高亮
call plug#end()

"set background=dark
"colorscheme PaperColor
color dracula

set t_Co=256
let g:airline_powerline_fonts = 1  " 设置airline支持powerline字体

let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#whitespace#enabled = 0  "取消airline空格检测

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ''

""let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ''

" cpp highlight
let g:cpp_experimental_template_highlight = 1
" cuda highlight 
" Enable highlighting of CUDA kernel calls
let g:cuda_kernel_highlight = 1
" Highlight keywords from CUDA Runtime API
let g:cuda_runtime_api_highlight = 1
" Highlight keywords from CUDA Driver API
let g:cuda_driver_api_highlight = 1
" Highlight keywords from CUDA Thrust library
let g:cuda_thrust_highlight = 1

" 设置tagbar
let g:tagbar_width=30
let g:tagbar_left=1

" 设置 deoplete.nvim
let g:deoplete#enable_at_startup = 1
"设置Tab为补全  deoplete
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"                
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"关闭deoplete preview 窗口
set completeopt-=preview

" 设置clang
" let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-12.so.1"
" let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
" let g:deoplete#custom#var#clangx#clang_binary = "/usr/bin/clang-12" "('clangx', 'clang_binary', '/usr/bin/clang-12')
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang-12')


"设置Supertab, 同时补全ultisnips和deoplete和vim-snippets
let g:SuperTabDefaultCompletionType = "<C-n>"

" https://www.jianshu.com/p/bb91582317ed
"
" 配置补全UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"   " 
"let g:UltiSnipsExpandTrigger="<expr> <space>"

" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

if executable('clipboard-provider')
  let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'clipboard-provider paste',
          \     },
          \ }
endif

" 配置echodoc
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'virtual'
" let g:echodoc#type = 'floating'

" 配置vimbuftabline
let g:buftabline_numbers=2

noremap <leader><Tab> :bnext<CR>

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


" 因为一些快捷键与'a'绑定, 所以取消了'a'进入插入模式
"nnoremap a <nop>      


" 配置nvim的terminal模式  未完成
"tnoremap <Esc> <C-\><C-n>
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'


"快捷键只在常规模式下有用 nnoremap
"设置 " "fs 为保存文件
"function vimfilertoRight()
"endfunction
"

nnoremap <F2> :TagbarToggle<CR>

nnoremap <leader>fs :w<CR>
nnoremap <leader>fsa :wall<CR>

nnoremap <leader>qq :wq<CR>
"vim windows窗口左右
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-l> <C-w>l<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>

"分割窗口
nnoremap <leader>wj :split<CR>
nnoremap <leader>wl :vsplit<CR>


"set hidden " 避免必须保存才可以跳转buffer


" 文件类型设置 FileType Settings
set sw=4
set ts=4
autocmd FileType markdown set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType c++ set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType c set tabstop=4 shiftwidth=4 expandtab ai

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufNewFile,BufRead *.cu set filetype=cpp

"defx
"-direction=topleft or botright
"nnoremap <F3> :Defx -split=vertical -winwidth=30 -direction=botright -root-marker="" -toggle -columns=icons:filename:type <CR>           
nnoremap <F3> :Defx -split=vertical -winwidth=30 -direction=botright -toggle<CR>

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
  
  "call defx#custom#column('filename', {
		  "\ 'directory_icon': '▸',
		  "\ 'opened_icon': '▾',
		  "\ 'root_icon': ' ',
		  "\ 'min_width': 40,
		  "\ 'max_width': 40,
		  "\ })

  call defx#custom#column('filename', {
		  \ 'directory_icon': '',
		  \ 'opened_icon': '',
		  \ 'root_icon': '',
		  \ 'min_width': 40,
		  \ 'max_width': 40,
  		  \ })

  "call defx#custom#column('mark', {
		  "\ 'readonly_icon': '✗',
		  "\ 'selected_icon': '✓',
		  "\ })

endfunction

"denite
" 

"列出所有buffer
nnoremap <leader>lb :Denite buffer<CR>
"列出当前目录的文件
"nnoremap <leader>lf :Denite file<CR>  没有必要
"递归列出当前目录下的文件
"nnoremap <leader>ls :Denite file/rec<CR>
nnoremap <leader>ls :Files<CR>
nnoremap <leader>lf :Buffers<CR>

"列出当前文件的行
"nnoremap <leader>ll :Denite line<CR>  
nnoremap <leader>ll :Lines<CR>  
noremap <leader>gls :GFiles<CR>
noremap <leader>gss :GFiles?<CR>   

"git 
noremap <leader>gad :Git add %<CR>
noremap <leader>gcm :Git commit<CR>
noremap <leader>gbm :Git blame<CR>

noremap <leader>bt :BTags<CR>
noremap <leader>st :Tags<CR>


" Change file/rec command.
" 自定义变量
call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#option('default', {
	\ 'auto_resize': 1,
	\ 'statusline': 0,
	\ 'winheight': 15,
	\ 'prompt': 'λ:',
	\ 'start_filter': 1,
	\ 'vertical_preview': 1, 
	\ 'floating_preview': 1,
	\ 'preview_width': 70,
	\ 'preview_height': 30,
	\ })

"call denite#custom#option('default', {
	"\ 'prompt': 'λ:',
	"\ 'empty': 0,
	"\ 'winheight': 16,
	"\ 'source_names': 'short',
	"\ 'floating-preview': 1,
	"\ 'auto-accel': 1,
	"\ 'auto-resume': 1,
	"\ })

"定义映射
"正常模式下的映射


"列出当前buffer的tag
nnoremap <leader>lt :Denite outline <CR>


"列出当前文件目录下的所有tag (means list all tags
nnoremap <leader>lT :call denite#start([{'name':'outline','args':['--recurse=yes']}]) <CR>  

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

"Denite插入模式下的映射
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Tab>',
      \ '<denite:move_to_next_line>',
      \ 'noremap' 
	  \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap' 
	  \)

" Change matchers.
call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/cpsm'])
"call denite#custom#source(
	""\ 'outline', 'args', )


" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])


" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',['scantree.py'])
