set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"  Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
"  Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
"  Plugin 'L9'
" " Git plugin not hosted on GitHub
"  Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
"  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
 " Plugin 'user/L9', {'name': 'newL9'}
 "Plugin 'altercation/vim-colors-solarized'
 set number
 syntax enable
 set background=dark
 "colorscheme solarized

 "
" " All of your Plugins must be added before the following line
call vundle#end()            " required
 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

execute pathogen#infect()
syntax on
 let g:syntastic_javascript_checkers = ['standard']
 autocmd bufwritepost *.js silent !standard-format -w %
 set autoread
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_loc_list_height = 5
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 1

 highlight link SyntasticErrorSign SignColumn
 highlight link SyntasticWarningSign SignColumn
 highlight link SyntasticStyleErrorSign SignColumn
 highlight link SyntasticStyleWarningSign SignColumn
filetype plugin indent on
