let mapleader = "<space>"

call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'

" Icons for files & emojis
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

" Fuzy finder
Plug 'junegunn/fzf'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'

" Support for editorconfig file
Plug 'editorconfig/editorconfig-vim'

" Show git status
Plug 'airblade/vim-gitgutter'

" Highlight yanked part in visual mode
Plug 'machakann/vim-highlightedyank'

" Limit VIM modelines.
Plug 'ciaranm/securemodelines'

" Easily comment out lines
Plug 'tpope/vim-commentary'

" Coc and language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-sources'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-snippets'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'fannheyward/coc-markdownlint'
Plug 'fannheyward/coc-pyright'
Plug 'josa42/coc-go'
Plug 'rust-lang/rust.vim'
Plug 'mindriot101/vim-yapf'
call plug#end()

" Map Ctrl+P to the FZF command
nmap <C-P> :FZF<CR>

" Map some uppercase to lowercase since I accidentally type :W many times
command WQ wq
command Wq wq
command W w
command Q q

" Airline configs
if !has('gui_running')
	set t_Co=256
endif
set noshowmode
let g:airline_theme='owo'
let g:airline#extensions#tabline#enabled = 1

" NERDTree settings.

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden=1
let NERDChristmasTree=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:NERDTreeIndicatorMapCustom = {
        \ "modified"  : "✹",
        \ "staged"    : "✚",
        \ "untracked" : "✭",
        \ "renamed"   : "➜",
        \ "unmerged"  : "═",
        \ "deleted"   : "✖",
        \ "dirty"     : "✗",
        \ "clean"     : "✔︎",
        \ 'ignored'   : '☒',
        \ "unknown"   : "?"
        \ }


" Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" Git gutter
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

"Coc

nmap <leader>rn <Plug>(coc-rename)
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:rustfmt_autosave = 1

" Rust things

au FileType rust source ~/.config/nvim/scripts/spacetab.vim
au FileType rust set colorcolumn=100

" Python auto-formatting
let g:yapf_style = "pep8"
autocmd BufWritePre *.py 0,$!yapf

" Vim stuff

filetype plugin indent on

set nohlsearch
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
set cmdheight=2
set updatetime=300


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

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

if has("autocmd")
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! h'\"" | endif
endif

" Coc snippets
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

colorscheme gruvbox
