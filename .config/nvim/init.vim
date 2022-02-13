"" ┌─────────────────────────────────────────────────────────────────┐  
"" |                                        ,e,                      |
"" |     888-~88e  e88~~8e   e88~-_  Y88b    /  "  888-~88e-~88e     |
"" |     888  888 d888  88b d888   i  Y88b  /  888 888  888  888     |
"" |     888  888 8888__888 8888   |   Y88b/   888 888  888  888     |
"" |     888  888 Y888    , Y888   '    Y8/    888 888  888  888     |
"" |     888  888  '88___/   '88_-~      Y     888 888  888  888     |
"" |                                                                 |
"" └─────────────────────────────────────────────────────────────────┘ 
""
"" Reuses things from https://github.com/craftzdog/dotfiles-public

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set hidden
let mapleader=","
nnoremap <Leader>v :e $MYVIMRC<cr>

" Reloads config after saving but keep cursor position
if !exists('*ReloadVimConfig')
   fun! ReloadVimConfig()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimConfig()


" turn on line numbering
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter *
    \ if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   *
    \ if &nu                  | set nornu | endif
augroup END

" Show a vertical colored line at column 80
set colorcolumn=80

" Set encodings
set fileencodings=ucs-bom,utf-8,cp1252,default,latin9
set fileencoding=utf-8
set encoding=utf-8
set fileformat=unix

" Enable syntax highlighting
syntax enable

" Setup indentation and 'tabs'
set autoindent
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" Set some fundamental options
set title
set nobackup
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set lazyredraw
set showmatch
set mat=2

" Incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add comment leader in block comments when hitting enter
set formatoptions+=r

" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction


"
" --- Misc highlighting options
"

set cursorline
set cursorcolumn
" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://"
    \| silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"'
    \| endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" Hightlight on yank
" From https://neovim.io/news/2021/07
au TextYankPost * lua vim.highlight.on_yank {
    \higroup="IncSearch", timeout=150, on_visual=true}


" Imports
" ---------------------------------------------------------------------
runtime ./plug.vim
runtime ./maps.vim


" Syntax highlighting
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  "set background=light
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  colorscheme NeoSolarized
endif


" Extras
" ---------------------------------------------------------------------

"set exrc

