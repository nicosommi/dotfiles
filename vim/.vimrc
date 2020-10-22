if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
"  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"  endif  

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kaicataldo/material.vim'
Plug 'junegunn/seoul256.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/shades-of-purple.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'gabrielelana/vim-markdown'  " Markdown support

Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

Plug 'jremmen/vim-ripgrep' " Ripgrep

Plug 'tpope/vim-fugitive' " Ripgrep

Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'

Plug 'majutsushi/tagbar'

call plug#end()

" Map leader to space
let mapleader = " "

" Set configuration
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" show line numbers
set number
syntax enable
filetype plugin indent on

" Theming
""" enable 24bit true color
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

"""" enable the theme
colorscheme shades_of_purple
let &t_Co=256

" autocmd VimEnter * Goyo
let g:limelight_conceal_ctermfg = 'gray'
autocmd VimEnter * Limelight

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" NERDTree Toggle Ctrl+E
nnoremap <C-e> :NERDTreeToggle<CR>
" Open file anywhere
map <C-p> :Files<CR>
" Othe fzf
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

nmap <C-o> :TagbarToggle<CR> " Tagbar outline

" Copy file with path
:nmap cfp :let @" = expand("%")<cr>

" Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Dont find in file names when finding in files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Enable auto completion
set wildmode=longest,list,full
set wildmenu

" Copy to OSX clipboard
set clipboard=unnamed

" Auto set cwd *may make others fail
autocmd BufEnter * silent! lcd %:p:h

" Ts server
let g:coc_global_extensions = [ 'coc-tsserver' ]

" Disable swap file
set noswapfile

let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'

set tags=./tags,tags;

let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1

