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
set tags=./.tags;,.tags          " ctags

" 配置python路径
let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.8'

" 设置path, vim中会索引
" set path+=/usr/include/c++/9/,/usr/local/include/,
" set path+=/usr/include/clang/12/include/,
set path+=/usr/include/python3.7
set path+=/usr/local/cuda-11.7/include
set path+=/usr/include/c++/9,/usr/include,/home/l0phtg/tools/llvm-projects/build/include

" 记录光标位置
"augroup resCur

"nmap 

"set background=dark

"plug插件
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'goolord/alpha-nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'

"Plug 'kosayoda/nvim-lightbulb' " code actions
Plug 'ray-x/lsp_signature.nvim'  "show function signature when typing

Plug 'simrat39/symbols-outline.nvim'  " symbols

"quickfix
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

"Plug 'nvim-Treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-context'

"search preview integrad
"ripgrep for find files, grap
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
"Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-rg.nvim'
"Plug 'MattesGroeger/vim-bookmarks'
"Plug 'tom-anders/telescope-vim-bookmarks.nvim'
"Plug 'nvim-telescope/telescope-dap.nvim'


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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vista.vim'

Plug 'Shougo/neoinclude.vim' "c 头文件补全
Plug 'Shougo/neco-syntax'    "关键字补全 keyword
Plug 'Shougo/echodoc'

Plug 'majutsushi/tagbar'   " tag显示
Plug 'ap/vim-buftabline'   " buffer

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'honza/vim-snippets'

" test
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'antoinemadec/FixCursorHold.nvim'
"Plug 'nvim-neotest/neotest'

Plug 'folke/which-key.nvim'

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

let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.linenr = ''

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

" welcome
luafile ~/.config/nvim/lua/alpha-dot.lua
" lsp && cmp
set completeopt=menu,menuone,noselect
" lsp
luafile ~/.config/nvim/lua/config.lua
luafile ~/.config/nvim/lua/cmp-dot.lua
luafile ~/.config/nvim/lua/lsp.lua
luafile ~/.config/nvim/lua/lsp-signature.lua
luafile ~/.config/nvim/lua/trouble-dot.lua

luafile ~/.config/nvim/lua/lsp-handlers.lua

luafile ~/.config/nvim/lua/symbols-outline-dot.lua

luafile ~/.config/nvim/lua/telescope-dot.lua
" which keys
luafile ~/.config/nvim/lua/whichkey-dot.lua

" clipboard
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
autocmd FileType lua set tabstop=2 shiftwidth=2 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufNewFile,BufRead *.cu set filetype=cpp

"defx
"-direction=topleft or botright
nnoremap <F3> :Defx -split=vertical -winwidth=30 -direction=botright -toggle<CR>
" let g:defx_icons_enable_syntax_highlight = 1

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

"Fzf
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

let g:fzf_tags_command = 'ctags -R -f ./.tags --exclude=".git" --exclude=".vscode"'
" let g:fzf_preview_window = []

"nnoremap <leader>ls :Files<CR>
"nnoremap <leader>lf :Buffers<CR>
nnoremap <leader>ls :Telescope find_files<CR>
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

"buffer tags
noremap <A-p> :BTags<CR>
"dir tags
noremap <A-P> :Tags<CR>
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

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
nnoremap <leader>lT :call denite#start([{'name':'outline',
			\ 'args':['--recurse=yes', '-f=./.tags', '--exclude=".git" --exclude=".vscode"']}]) <CR>

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
