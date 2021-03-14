call plug#begin('~/.vim/plugged')

Plug 'GutenYe/json5.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'hashivim/vim-terraform'
Plug 'jxnblk/vim-mdx-js'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vmchale/dhall-vim'
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'arthurxavierx/vim-caser'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'zaid/vim-rec'
Plug 'lluchs/vim-wren'
Plug 'whiteinge/diffconflicts'
Plug 'elixir-editors/vim-elixir'
Plug 'alaviss/nim.nvim'
Plug 'earthly/earthly.vim', { 'branch': 'main' }

" Completion plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()


" Completion config
lua <<EOF
local nvim_lsp = require'lspconfig'

nvim_lsp.gopls.setup{
    root_dir = nvim_lsp.util.root_pattern('.git');
    on_attach=require'completion'.on_attach;
}

nvim_lsp.rust_analyzer.setup{
    root_dir = nvim_lsp.util.root_pattern('.git');
    on_attach=require'completion'.on_attach;
}
EOF

let g:go_code_completion_enabled = 0
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


" Language type settings
filetype plugin on
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType json5 setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript.jsx setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript.tsx setlocal tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.hcl set filetype=terraform
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx


" Global keybindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <C-\> :vsplit<CR>
nnoremap <silent> <C-_> :split<CR>
tnoremap <C-J> <C-\><C-N>
nnoremap <silent> <S-H> :tabprevious<CR>
nnoremap <silent> <S-L> :tabnext<CR>
nnoremap <silent> <C-T> :tabnew term://zsh -l<CR>

" LSP keybindings
"nmap <silent> @ :GoDecls<CR>
nmap <silent> gn <cmd>lua vim.lsp.buf.rename()<CR>
nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>

" Go-vim settings
let g:go_fmt_autosave = 0


" Autosave
let g:auto_save = 1
let g:auto_save_silent = 1


" Nord Theme
colorscheme nord

let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1

" Statusline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}



" Sane defaults
set tabstop=4
set noequalalways
set fixendofline
set shiftwidth=4
set expandtab
set smarttab
set showtabline=2
set guioptions-=e
set laststatus=2
set nofoldenable
set foldmethod=manual
"set termguicolors (somehow breaks color scheme when using tmux)
set nohlsearch
set number
set hidden
set splitbelow
set splitright
set ignorecase
set smartcase
set signcolumn=no
set shortmess+=c
set updatetime=300
set timeoutlen=750
set relativenumber


" NERDTree
let NERDTreeIgnore=['\.o$', '\~$', '__pycache__', 'node_modules', 'target', 'venv']
let NERDTreeShowHidden=1

let g:NERDTreeGitStatusUseNerdFonts = 1

function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        execute ":NERDTreeClose"
    else
        if strlen(expand("%")) > 0
            if stridx(expand("%"), "term://") == -1
                execute ":NERDTreeFind"
            else
                execute ":NERDTreeToggle"
            endif
        else
            execute ":NERDTreeToggle"
        endif
    endif
endfunction

map <silent> <C-f> :call NERDTreeToggleInCurDir()<CR>
