"VIM config

" set runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/Vundle.vim'


" end vundle plugins
call vundle#end()
filetype plugin indent on


" syntax highlighting
syn on

" indent automatically
set autoindent

" indent with 2 spaces
set ts=2
set shiftwidth=2

" use spaces for tabs
set expandtab

" default file encoding
set enc=utf-8

