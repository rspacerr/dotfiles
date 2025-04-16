" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

set showcmd         " Always show the command as it is being typed.
set tabstop=4       " Tab length
set shiftwidth=4    " 4 space >indent
set ruler           " Always show current position
set cmdheight=1     " Height of the command bar
set hid             " A buffer becomes hidden when it is abandoned
set ignorecase      " ignore case when searching

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" disable bells
set belloff=all
set novisualbell
set t_vb=
set tm=500

" Autoindent
filetype plugin indent on

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" status line
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
