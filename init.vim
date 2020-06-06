call plug#begin('~/.local/share/nvim/plugged')

Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

call plug#end()


" Completion
" Better display for messages
"set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300


" Permanent undo
set undodir=~/.vimdid
set undofile

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Use wide tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab


" Sane splits
"set splitright
"set splitbelow

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


set number relativenumber


" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" customise deoplete                                                                                                                                                     " maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy

