call plug#begin('~/.config/nvim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'airblade/vim-rooter'

" UI
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'

" Misc
Plug 'editorconfig/editorconfig-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'ciaranm/securemodelines'

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" Autocompletion plugins
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ambv/black'
Plug 'hrsh7th/nvim-compe'

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

" LSP Settings
lua << END
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local servers = { "rust_analyzer", "pyright", "clangd", "gopls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
			}
		}
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	}
)

require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = true;

source = {
	path = true;
	nvim_lsp = true;
	};
}

local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
local col = vim.fn.col('.') - 1
if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
	return true
else
	return false
end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
if vim.fn.pumvisible() == 1 then
	return t "<C-n>"
elseif check_back_space() then
	return t "<Tab>"
else
	return vim.fn['compe#complete']()
end
end
_G.s_tab_complete = function()
if vim.fn.pumvisible() == 1 then
	return t "<C-p>"
else
	return t "<S-Tab>"
end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
END

" Use ripgrep
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" LSP language specific
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

autocmd BufWritePre *.py execute ':Black'
au Filetype rust set colorcolumn=100

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

if has("autocmd")
	" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

colorscheme sonokai
