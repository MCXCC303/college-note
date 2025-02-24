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

" vim-csv
Plug 'chrisbra/csv.vim'
    let g:csv_arrange_align='lc*'

" wal Theme
Plug 'dylanaraps/wal'

" vim-snippets
Plug 'honza/vim-snippets'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" fzf.vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
    let g:vim_markdown_folding_style_pythonic=1

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
set autoindent
set bg=dark
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=0
set number
set rtp+=${HOME}/Notebook
set ruler
set shiftwidth=4
set smartcase
set softtabstop=4
set tabpagemax=15
set tabstop=4
set viminfo='1000,<500
syntax on

" conceal (vimtex)
hi clear Conceal

" Netrw
let g:netrw_cursor=2
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle=3

" CurSor & Line
hi CursorLine ctermfg=NONE ctermbg=NONE
let &t_SI="\e[5 q"
let &t_SR="\e[3 q"
let &t_EI="\e[1 q"

" Searching
highlight Search ctermfg=NONE ctermbg=235

" fzf.vim
let g:fzf_vim = {}

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

" vim-csv
nnoremap rr :%ArrangeColumn<CR>

" F5 Compile
nnoremap <F5> :call ComplieRun()<CR>
func! ComplieRun()
    exec "w"
    if &filetype == "python"
        exec "!python %"
    endif
endfunc

" Inkscape-figure
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
