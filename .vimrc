au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html

" indent help plugin
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333 ctermbg=black 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222 ctermgb=grey

au FileType *  IndentGuidesEnable

"for vundle
set nocompatible               " be iMproved
filetype off                   " required!

"powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
let g:Powerline_symbols = 'fancy'

"Vim bundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set ignorecase
au FileType md IndentGuidesDisable

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" 
" original repos on github
"Bundle 'thanthese/Tortoise-Typing'
"Bundle 'mivok/vimtodo'
Bundle 'tpope/vim-fugitive'
Bundle 'Townk/vim-autoclose'
Bundle 'dagwieers/asciidoc-vim'
Bundle 'scrooloose/nerdtree'  
"Bundle 'rosenfeld/conque-term'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'msanders/snipmate.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'
Bundle 'fholgado/minibufexpl.vim'
Bundle  'scrooloose/syntastic'
"Bundle 'nelstrom/vim-markdown-folding'
Bundle 'mikewest/vimroom'

" vim-scripts repos
Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!


"GUI options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
"set guifont=Droid\ Sans\ Mono\ 8
set guifont=Source\ Code\ Pro\ 8 

:set spell
set background=dark
call togglebg#map("<F5>")
"color jellybeans
colorscheme solarized
syntax on
set mouse:a
set number
set cursorline
set autoindent

" remove the possibility to move in insert mode
" force to sheet back vim

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

function! CheckBrightness()
let g:light=system('/home/damaru/light.sh')
endfunction	

com! BR call CheckBrightness()


if &term =~ "xterm\\|rxvt"
	" use an orange cursor in insert mode
	let &t_SI = "\<Esc>]12;orange\x7"
	"     " use a red cursor otherwise
	let &t_EI = "\<Esc>]12;red\x7"
	silent !echo -ne "\033]12;red\007"
	" reset cursor when vim exits
	autocmd VimLeave * silent !echo -ne "\033]112\007"
	"               " use \003]12;gray\007 for gnome-terminal
endif

"setlocal foldmethod=syntax
"let html_folding=1

""""""""""""""""""""""""""""""""'writer room in vim


function WordCount()
	  let s:old_status = v:statusmsg
		let position = getpos(".")
		  exe ":silent normal g\<c-g>"
		let stat = v:statusmsg
		let s:word_count =0 
		if stat != '--No Lines in buffer--'
			  let s:word_count = str2nr(split(v:statusmsg)[11])
				  let v:statusmsg = s:old_status
				end
				call setpos('.',position)
					  return s:word_count
					endfunction

func! WriterMood() 
	setlocal formatoptions=tcq 
	set foldcolumn=9
	set nonumber
		set wrapmargin=80

set statusline=%{WordCount()}
"	set formatprg=par
	"setlocal wrap 
	"setlocal linebreak 
endfu 
com! WM call WriterMood()
let g:dark=1
fu! ColorSwitch()
	if g:dark
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333 ctermbg=lightgrey 
		let g:dark=0
ToggleBG
	else
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333 ctermbg=black 
		let g:dark=1
ToggleBG
	endif
endfu

nnoremap <F4> :call ColorSwitch()<CR>
com! SW call ColorSwitch()

"Layout of the screen
"
set scrolloff=999
set colorcolumn=80
let g:netrw_ignorenetrc=1

:nmap D :! ./deploy
set sw=2 ts=2 sts=4
"let g:indent_guides_auto_colors = 1
