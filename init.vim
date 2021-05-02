call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'vim-scripts/lightline'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'ciaranm/securemodelines'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Support for programming languages.
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-json'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'fannheyward/coc-markdownlint'
Plug 'fannheyward/coc-pyright'
Plug 'josa42/coc-go'
call plug#end()

" Map Ctrl+P to the FZF command
nmap <C-P> :FZF<CR>

" Map some uppercase to lowercase since I accidentally type :W many times
command WQ wq
command Wq wq
command W w
command Q q

" Lightline configs
if !has('gui_running')
	  set t_Co=256
endif
set noshowmode
let g:lightline = { 'colorscheme': 'seoul256' }

" Coc Rust stuff

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Autocompletion

set cmdheight=2
set updatetime=300

" Vim stuff

filetype plugin indent on

set autoindent
set timeoutlen=300
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set printencoding=utf-8
set signcolumn=yes
set splitright
set splitbelow
set undodir=~/.config/nvim/vimdid
set undofile

set wildmenu
set wildmode=list:longest
set wildignore=*.png,*.jpg,*.gif,*.mp4,*.mp3,*.o,vendor,publish/*,*.min.*,*.db

set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

set formatoptions=tc
set formatoptions+=r
set formatoptions+=q
set formatoptions+=n
set formatoptions+=b

set incsearch
set ignorecase
set smartcase
set gdefault

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Vim GUI stuff

set termguicolors
set guioptions-=T
set vb t_vb=
set backspace=2
set nofoldenable
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber
set number
set diffopt+=iwhite
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80
set showcmd
set mouse=a
set shortmess+=c

" Disable arrow keys

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <letf> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use ctrl + . to trigger the autocomplete
inoremap <silent><expr> <c-.> coc#refresh()

if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

if has("autocmd")
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! h'\"" | endif
endif

colorscheme gruvbox
