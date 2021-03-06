set nu		"设置行号
syntax on	"打开高亮
syntax enable "打开代码高亮
set history=50
set autoread	"当文件在外部被改变时，vim自动跟新载入
set magic	"正则表达式匹配形式
set showcmd
set noshowmode
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set hlsearch
set cmdheight=1
set clipboard+=unnamed	"共享剪切板
set autoindent			"自动缩进
set cindent
set incsearch			"在搜索的同时，直接匹配

"设置vim中文手册，其文件在.vim/doc文件夹中
set helplang=cn

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
"Rebind <Leader> key
"let mapleader = ","

"map <leader>n <esc>:tabprevious<CR>
"map <leader>m <esc>:tabnext<CR>

"启用鼠标
""set mouse=a
""set selection=exclusive
""set selectmode=mouse,key

:set tags=tags

"使vim快速进入paste模式
set pastetoggle=<F10>

"设置快捷键将选中文本复制到系统剪切板
""vnoremap <Leader>y "+y
"将系统剪切板内容复制到vim
""nmap <Leader>p "+p

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8


"tmux配置
""if exists('$TMUX')
""	set term=screen-256color
""endif

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)

""function! WrapForTmux(s)
""  if !exists('$TMUX')
""    return a:s
""  endif

"  let tmux_start = "\<Esc>Ptmux;"
"  let tmux_end = "\<Esc>\\"

""  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
""endfunction

""let &t_SI .= WrapForTmux("\<Esc>[?2004h")
""let &t_EI .= WrapForTmux("\<Esc>[?2004l")

""function! XTermPasteBegin()
""  set pastetoggle=<Esc>[201~
""  set paste
""  return ""
""endfunction

""inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"sdcv配置
""function! Mydict()
""  let expl=system('sdcv -n ' .
""  \ expand("<cword>"))
""  windo if
""  \ expand("%")=="diCt-tmp" |
""  \ q!|endif
""  25vsp diCt-tmp
""  setlocal buftype=nofile bufhidden=hide noswapfile
""  1s/^/\=expl/
""  1  
""endfunction
""nmap F :call Mydict()<cr>

source $VIMRUNTIME/ftplugin/man.vim
cmap man Man
nmap K :Man <cword><CR>
"vundle{
set nocompatible	"be iMproved,required
filetype off		"required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively,pass a path where Vundle should install plugins
Plugin 'VundleVim/Vundle.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'yianwillis/vimcdoc'
Bundle 'wesleyche/SrcExpl'
""Bundle 'taglist.vim'  已被tagbar代替
""let Tlist_Use_Right_Window=1
""let Tlist_File_Fold_Auto_Close=1
""let Tlist_Show_One_File=1
""let Tlist_Exit_OnlyWindow=1
""let Tlist_WinWidth=25
""map <F5> :TlistToggle<CR>


Bundle 'Valloric/YouCompleteMe'
"以下文件格式不使用ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
"let g:ycm_max_diagnostics_to_display = 3
"自动关闭预览窗口
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_python_binary_path = '/usr/bin/python3.5'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui=0
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

""Bundle 'scrooloose/nerdtree'   mac上iterm2配合zsh自带了netrw，不再需要安装
""let NERDTreeWinSize=30
""map <F4> :NERDTreeToggle<CR>

Bundle 'bling/vim-airline'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0 
"let g:airline#extensions#whitespace#symbol = '!'
"let g:airline#extensions#tabline#enabled = 1

""Bundle 'altercation/vim-colors-solarized'
"set background=dark
"colorscheme solarized 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized 在终端下现实的不太好
""if has('gui_running') 
""  set go="not show enum tools list
""  set background=dark
""  let g:solarized_menu=0
""  colorscheme solarized 
""else
  "let g:solarized_termcolors=&t_Co
  "let g:solarized_termtrans=1
  "colorscheme distinguished 
""  colorscheme torte 

  "highlight LineNr ctermfg=239
""  highlight LineNr ctermfg=239
""  highlight Pmenu ctermbg=6
""  highlight PmenuSel ctermbg=81
""endif

""Bundle 'terryma/vim-multiple-cursors'
""let g:multi_cursor_next_key='<C-n>'
""let g:multi_cursor_prev_key='<C-p>'
""let g:multi_cursor_skip_key='<C-x>'
""let g:multi_cursor_quit_key='<Esc>'
"快速给词加上环绕符号
Bundle 'tpope/vim-surround'			
"文件时光机？？？
"sjl/gundo.vim
""Bundle 'ctrip.vim'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'c.vim'
""Bundle 'scrooloose/nerdcommenter'
""Bundle 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required
"}
