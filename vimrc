syntax on
set modeline
set expandtab
set tabstop=4
set shiftwidth=4
set exrc " .vimrc in local project dir
set secure
autocmd BufRead,BufNewFile * set signcolumn=yes
autocmd FileType tagbar,nerdtree set signcolumn=no
set foldmethod=indent
set nofoldenable
set number relativenumber
set diffopt+=vertical
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END

"-- PATHOGEN --
execute pathogen#infect()

"-- TRUE COLOR --
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors") && $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

"-- THEMING --
set cursorline
set background=dark

let g:airline_theme='material'
let g:material_theme_style = 'darker'
colorscheme material
hi Normal       ctermbg=NONE guibg=NONE
hi SignColumn   ctermbg=235 guibg=#262626
hi LineNr       ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE
hi CursorLineNr ctermbg=NONE guibg=NONE ctermfg=178 guifg=#d7af00

let g:gitgutter_set_sign_backgrounds = 0

"-- Whitespace highlight --
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"-- ALE --
hi clear ALEErrorSign
hi clear ALEWarningSign
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '‚úò'
let g:ale_sign_warning = '‚óã'
hi Error    ctermfg=204 ctermbg=NONE guifg=#ff5f87 guibg=NONE
hi Warning  ctermfg=178 ctermbg=NONE guifg=#D7AF00 guibg=NONE
hi ALEError ctermfg=204 guifg=#ff5f87 ctermbg=52 guibg=#5f0000 cterm=undercurl gui=undercurl
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'javascript': ['eslint'],
            \ 'go': ['gobuild', 'gofmt'],
            \ 'rust': ['rls']
            \}
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8'],
            \ 'javascript': ['eslint'],
            \ 'go': ['gofmt', 'goimports'],
            \ 'rust': ['rustfmt']
            \}
let g:ale_fix_on_save = 1

"-- NERDTree --
let NERDTreeShowHidden=1

"-- Airline --
let g:airline#extensions#tabline#enabled = 1

"-- Exuberant Ctags --
set tags=tags

"-- NVIM configuration --
if has('nvim')
    " Enable deoplete when InsertEnter.
    let g:deoplete#enable_at_startup = 0
    autocmd InsertEnter * call deoplete#enable()

    set belloff=""
    call deoplete#custom#source('_',  'max_menu_width', 0)
    call deoplete#custom#source('_',  'max_abbr_width', 0)
    call deoplete#custom#source('_',  'max_kind_width', 0)

    set hidden
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'go': ['~/.go/bin/gopls']
        \ }
endif