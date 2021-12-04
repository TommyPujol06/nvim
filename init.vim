call plug#begin('~/.config/nvim/plugged')
" GitHub copilot
Plug 'github/copilot.vim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'airblade/vim-rooter'

" UI
Plug 'liuchengxu/space-vim-dark'
Plug 'vimpostor/vim-tpipeline'
Plug 'andymass/vim-matchup'

" Misc
Plug 'editorconfig/editorconfig-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'ciaranm/securemodelines'

Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'ambv/black'

call plug#end()

" Map Ctrl+P to the FZF command
nmap <C-P> :FZF<CR>

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

set completeopt=menuone,noinsert,noselect
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

nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

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
set colorcolumn=90
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

let g:copilot_filetypes = { 'txt': v:false, 'tex': v:false } " Disable copilot for txt & latex files

let g:tpipeline_autoembed = 0
let g:tpipeline_statusline = '%f %l/%L %p%%'

" Use ripgrep
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

let $FZF_DEFAULT_COMMAND = 'rg --files'

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

autocmd BufWritePost *.py execute ':Black'
au Filetype rust set colorcolumn=100

setlocal spell
set spelllang=en_gb,ca,es

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END

colorscheme space-vim-dark
hi! Normal guibg=000000
