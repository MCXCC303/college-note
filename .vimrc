let mapleader = "\\"
"—————————————"
" Plugin List "
"—————————————"
call plug#begin()
" vimtex
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
    set conceallevel=2
    let g:tex_flavor='latex'
    let g:tex_conceal='abdmg'
    let g:vimtex_quickfix_mode=2
    let g:vimtex_quickfix_autoclose_after_keystokes=2
    let g:vimtex_view_method='zathura'
    let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
    let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

" UltiSnips
Plug 'sirver/ultisnips', { 'for': ['tex', 'snippets'] }
    let g:UltiSnipsExpandTrigger='<TAB>'
    let g:UltiSnipsJumpForwardTrigger='<TAB>'
    let g:UltiSnipsJumpBackwardTrigger='<S-TAB>'

" vim-csv
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
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
    let g:fzf_vim = {}

" vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown', { 'for': 'markdown' }
    let g:vim_markdown_folding_style_pythonic=1

" ALE
Plug 'dense-analysis/ale'
    " linter and fixer
    let g:ale_linters = {
    "\   'python': ['pyright', 'mypy', 'flake8', 'pylint'],
    \   'python': ['ruff'],
    \   'markdown': ['prettier', 'markdownlint'],
    \}
    let g:ale_fixers = {
    \   'python': ['ruff', 'ruff_format'],
    \   'json': ['jq'],
    \   'markdown': ['prettier'],
    \   'tex': ['latexindent'],
    \}
    let g:ale_json_jq_options = '--indent 4'
    " Outlook
    let g:ale_sign_error = ''
    let g:ale_sign_warning = ''
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
    let g:ale_virtualtext_cursor = 'disabled'
    " file type detect
    let g:ale_enabled = 0
    let g:ale_linters_explicit = 1
    " Delay
    let g:ale_lint_delay = 1
    let g:ale_echo_delay = 1
    " lints
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    " close completes (use coc)
    let g:ale_disable_lsp = 1
    let g:ale_completion_enabled = 0
    " let g:ale_completion_autoimport = 1
    " let g:ale_completion_delay = 1
    " float window
    let g:ale_hover_to_floating_preview = 1
    let g:ale_detail_to_floating_preview = 1

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_enabled = 0
    let g:coc_global_extensions = ['coc-pyright']

call plug#end()
"—————————————————"
" Plugin List End "
"—————————————————"

"———————————"
" Functions "
"———————————"
" F10 Compile
func! ComplieRun()
    exec "w"
    if &filetype == "python"
        exec "!python '%'"
    endif
endfunc

" Coc tab check
func! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunc

" Coc Documentation
func! ShowDoc()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunc

" Disable some options for latex
func! TexInit()
    if &filetype != "tex"
        " open sign column except tex
        set signcolumn=number
        let g:ale_enabled = 1
        let g:coc_enabled = 1
        nnoremap <silent> K :call ShowDoc()<CR>
        nnoremap <silent> rr :CocRestart<CR>
    endif
endfunc

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
set tag=./tags;,tags
set viminfo=%,'1000,<500
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

"—————————"
" Key Map "
"—————————"
" Texting
nnoremap <F5> :w<CR>
inoremap <F5> <ESC>:w<CR>gi

" Resize
nnoremap -- :resize -3<CR>
nnoremap == :resize +3<CR>
nnoremap ++ :vertical resize +3<CR> 
nnoremap __ :vertical resize -3<CR>

" vim-csv
if &filetype == 'markdown'
    nnoremap rr :%ArrangeColumn<CR>
endif

" F10 Compile
nnoremap <F10> :call ComplieRun()<CR>

" Inkscape-figure
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" ALE
nnoremap <silent> <C-S-l> :ALEFix<CR>
inoremap <silent> <C-S-l> <ESC>:ALEFix<CR>gi
" nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
" nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" Coc
nnoremap <silent> <Leader>rn <Plug>(coc-rename)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> ge <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> <C-k> :call CocActionAsync('diagnosticPrev')<CR>
nnoremap <silent> <C-j> :call CocActionAsync('diagnosticNext')<CR>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"——————————————"
" auto command "
"——————————————"
" Enable UltiSnips for tex, disable coc
augroup tex_init
    autocmd FileType tex silent CocDisable
    autocmd BufRead, BufNewFile * call TexInit()
augroup END
