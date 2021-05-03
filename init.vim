:let mapleader = "<space>"

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'ciaranm/securemodelines'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'
Plug 'FuDesign2008/emoji-snippets.vim'
Plug 'dense-analysis/ale'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Support for programming languages.
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
call plug#end()

" Map nerdtree keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Emoji autocomplete
set completefunc=emoji#complete
augroup emoji_complete
  autocmd!
  autocmd FileType markdown setlocal completefunc=emoji#complete
  " Emoji command to replace emoji name with emoji e.g. :apple: with 🍎
  command! -nargs=* Emoji %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
augroup END

" Map Ctrl+P to the FZF command
nmap <C-P> :FZF<CR>

" Map some uppercase to lowercase since I accidentally type :W many times
command WQ wq
command Wq wq
command W w
command Q q

" Comfy scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
let g:comfortable_motion_friction = 50.0
let g:comfortable_motion_air_drag = 1.0

" Airline configs
if !has('gui_running')
	set t_Co=256
endif
set noshowmode
let g:airline_theme='owo'
let g:airline#extensions#tabline#enabled = 1

" NERDTree settings.
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

" Ale things
let g:ale_linters = { 'python': ['flake8', 'pylint'] }
let g:ale_fixers = { 'python': ['yapf'] }
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1


" Autocompletion

set cmdheight=2
set updatetime=300

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
