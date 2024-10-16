"—————————————"
" Plugin List "
"—————————————"
call plug#begin()
" vimtex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
	set conceallevel=2
	let g:tex_flavor='latex'
	let g:tex_conceal='abdmg'
    let g:vimtex_quickfix_mode=2
    let g:vimtex_quickfix_autoclose_after_keystokes=2
	let g:vimtex_view_method='zathura'
	let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
	let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

" UltiSnips
Plug 'sirver/ultisnips'
	let g:UltiSnipsEditSplit="vertical"
	let g:UltiSnipsExpandTrigger='<tab>'
	let g:UltiSnipsJumpForwardTrigger='<tab>'
	let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='simple'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=2
    let g:airline#extensions#tabline#formatter='default'

" wal Theme
Plug 'dylanaraps/wal'

" vim-snippets
Plug 'honza/vim-snippets'

" vim-fugitive
Plug 'tpope/vim-fugitive'

call plug#end()
"—————————————————"
" Plugin List End "
"—————————————————"

"——————————————"
" Vim Settings "
"——————————————"
" color scheme
colorscheme wal

" Texting
set bg=dark
set rtp+=${HOME}/Notebook/current-semester
set ruler
set number
set tabstop=4
set viminfo='1000,<500
set expandtab
set autoindent
set cursorline
set ignorecase
set shiftwidth=4
set tabpagemax=15
set softtabstop=4
syntax on

" conceal (vimtex)
hi clear Conceal

" Netrw
let g:netrw_cursor=2
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle=3

" CurSor & Line
hi CursorLine ctermfg=NONE ctermbg=black
let &t_SI="\e[5 q"
let &t_SR="\e[3 q"
let &t_EI="\e[1 q"

"—————————”
" Key Map “
"—————————”
" Texting
nnoremap w :w<CR>

" Resize
nnoremap -- :resize -3<CR>
nnoremap == :resize +3<CR>
nnoremap ++ :vertical resize +3<CR> 
nnoremap __ :vertical resize -3<CR>
