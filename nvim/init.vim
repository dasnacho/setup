set showcmd
let g:mapleader = "\<Space>"

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'pseewald/vim-anyfold'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify'
endif

Plug 'arcticicestudio/nord-vim'
call plug#end()

" Color Scheme
colorscheme nord

" Folds
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=99

" Line numbers
set number
set relativenumber

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Sane pane splits
set splitbelow
set splitright

" close buffer
nmap <silent> <leader>Q :bd<CR>

" coc stuff
set updatetime=300

if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >=0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" NerdTree configuration
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF stuff
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>/ :execute 'rg ' . input('rg/')<CR>

" blamer
nnoremap <silent> <leader>gb :BlamerToggle<CR>
let g:blamer_prefix = ' > '
let g:blamer_date_format = '%Y-%m-%d %H:%M'

" vim signify
set updatetime=100
