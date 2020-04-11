" Learn Vimscript The Hard Way
" ----------------------------
" general configuration and exercises
" -----------------------------------
"" General{{{
" Basic settings {{{
" line and relative line numbers
set number relativenumber
" switch semi-colon and color behavior
nnoremap ; :
nnoremap : ;
" delightful colorscheme shipped with vim
colorscheme pablo
" customize listchars which visualize whitespaces and enable them
set listchars=tab:¦\ ,trail:·,extends:»,precedes:«,nbsp:× " ,eol:¬
set list
" define default indent settings (tabs by default with a width of 2)
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
" switch block-wise and line-wise modes: use v for block-wise by default
nnoremap v <c-v>
nnoremap <c-v> v
" }}}
" FileType-specific settings {{{
" }}}
" Mappings {{{
" }}}
" Statusline {{{
" }}}

" generate a timestamp easily
iabbrev xdate <c-r>=strftime('%F %H:%M')<cr>
" allow to move one extra char beyond the EOL
set virtualedit+=onemore
" emulate around entire document
onoremap ae ggVG
" toggle folds with spacebar
nnoremap <space> za
" easier conf file modification and reload
let myconf = $HOME . '/bin/github/learn_vimscript/vimrc'
nnoremap <expr> <localleader>ev ':vsplit ' . myconf . '<cr>'
nnoremap <expr> <localleader>sv ':source ' . myconf . '<cr>'
" insert empty line above or below the current one
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k
"}}}

" Chapter 01 - 2020-02-26 04.13 {{{
" - Exercise 1.3
" echo ">^.^<"
" }}}
" Chapter 02 - 2020-02-27 12.51 {{{
" - Exercise 2.6
" set number! relativenumber!
" }}}
" Chapter 03 - 2020-03-03 13.30 {{{
" - Exercise 3.3
" move the current line to the next one, if it exists
" :map - ddp
" move the current line to the previous one
" NB: doesn't work as expected at
" the first and last line!
" :map _ ddkP
" }}}
" Chapter 04 - 2020-03-04 13.59 {{{
" - Exercise 4.3
" convert to uppercase the word under the cursor in insert mode
" imap <c-u> <esc>gUiwi " noremap converted in ex. 5.4
" convert to uppercase the word under the cursor in normal mode
" nmap <c-u> gUiw       " noremap converted in ex. 5.4
" }}}
" Chapter 05 - 2020-03-05 14.59 {{{
" - Exercise 5.4
" convert to uppercase the word below the cursor in insert and normal mode
" inoremap <c-u> <esc>gUiwi
" nnoremap <c-u> gUiw
" }}}
" Chapter 06 - 2020-03-05 14.59 {{{
" - Exercise 6.4
" use <leader>
let mapleader = "\\"
let maplocalleader = "\\"
inoremap <leader>u <esc>gUiwi
nnoremap <leader>u gUiw
" }}}
" Chapter 07 - 2020-03-06 13.34 {{{
" - Exercise 7.4
" nnoremap <localleader>ev :vsplit $MYVIMRC<cr>
" nnoremap <localleader>sv :source $MYVIMRC<cr>
" }}}
" Chapter 08 - 2020-03-09 14.30 {{{
" - Exercise 8.4
iabbrev xgh https://github.com/github_user
iabbrev xcv https://bit.ly/giuseppe-ricupero-cv
iabbrev xsig -- <cr>Name Surnamp<cr><name.surname@company.com>
" }}}
" Chapter 09 - 2020-03-10 14.27 {{{
" - Exercise 9.2
" wrap the work under cursor in single quotes
" NB: it doesn't work well on single char words
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" wrap selected area in single quotes
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
" remap H (default to N from the first line) to go at the beginning of the current line
" nnoremap H 0
" remap L (default to N from the last line) to go at the end of the current line
" nnoremap L $
" }}}
" Chapter 10 - 2020-03-11 16.03 {{{
inoremap jk <esc>
" ino <esc> <nop>
" }}}
" Chapter 12 - 2020-03-16 19.44 {{{
" create a FileType autocommand that use setlocal to set some options
" 1. set spell for the asciidoc files
augroup lvthw_ch12
	autocmd!
	autocmd FileType asciidoc setlocal spell spelllang=it,en
	" 2. create "comment this line" autocommand for lilypond files
	autocmd FileType lilypond nnoremap <buffer> <localleader>c I% <esc>
augroup end
" }}}
" Chapter 13 - 2020-03-17 15.08 {{{
" create some snippet using iabbrev and autocmd
" groovy snippet
augroup groovy_lvthw
	autocmd!
	autocmd FileType groovy iabbrev pln println ""<left>
	autocmd FileType groovy iabbrev println NOPENOPENOPE
augroup end
" }}}
" Chapter 14 - augroup usage - 2020-03-20 14.40{{{
augroup filetype_html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
"}}}
" Chapter 15 - Operator-Pending Mappings{{{
" example 1 - remap paste as inside parens
" onoremap p i(
" example 2 - delete till the return statement
" onoremap b /return<cr>
" example 3 - change inside next round parens
" onoremap in( :<c-u>normal! f(vi(<cr>
" ex. 1 - change inside last round parens
" onoremap il( :<c-u>normal! F(vi(<cr>
" exs - create around next and last round parens
" onoremap an( :<c-u>normal! f(va(<cr>
" onoremap aL( :<c-u>normal! F)va(<cr>
" create similar mappings from curly brackets
" onoremap in{ :<c-u>normal! f{vi{<cr>
" onoremap il{ :<c-u>normal! F{vi{<cr>
" onoremap an{ :<c-u>normal! f{va{<cr>
" onoremap aL{ :<c-u>normal! F{va{<cr>
"}}}
" Chapter 16 - More Operator-Pending Mappings {{{
" example 1,2 - markdown headings
" onoremap ih :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rkvg_"<cr>
" onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
" exercise 1 - make the markdown headings command work also with '-'-based headings
" onoremap ih :<c-u>execute "normal! ?^[=-]\\{2,}\r:nohsearch\rkvg_"<cr>
" onoremap ah :<c-u>execute "normal! ?^[=-]\\{2,}\r:nohsearch\rg_vk0"<cr>
" exercise 2 - rewrite the above mapppings inside an appropriate autogroup
augroup filetype_markdown
	autocmd!
	autocmd FileType markdown ono <buffer> ih :<c-u>exe "norm! ?^[=-]\\{2,}\r:noh\rkvg_"<cr>
	autocmd FileType markdown ono <buffer> ah :<c-u>exe "norm! ?^[=-]\\{2,}\r:noh\rg_vk0"<cr>
augroup END

" exercise 3 - create an inside next email address
onoremap in@ :<c-u>execute "norm! /[[:alnum:]_.-]\\{3,}@[[:alnum:]_.-]\\{3,}[.][[:alnum:]_]\\{2,}\r:noh\rviW"<cr>
"}}}
" Chapter 17 - Status Line p1 {{{
" example 1 - statusline all in one command
" set statusline=%f\ -\ FileType:\ %y
" example 2 - split statusline commands
" set statusline=%f           " current buffer filename
" set statusline+=\ -\        " separator
" set statusline+=FileType:\  " filetype label
" set statusline+=%y          " actual FileType between square brackets
" example 3 - current line number  / total lines number
" set statusline=%l/%L
" example 4
" set statusline=[%4l] " current line number space-padded to have a fixed width of 4
" example 5 - padding on the right side
" set statusline=Current:\ %-4l\ Total:\ %-4L
" example 6 - zero padding for current line number (zero padding is available
" for numbers only values)
" set statusline=%04l
" example 7 - full path to the current file
" set statusline=%F
" example 8 - full path with maximum width
" set statusline=%.20F
" general format of a statusline item (e.g., %l/%L, %f/%F)
" %-0{min_width}.{max_width}{item} " everything is optional but % and {item}
" example 9 - basic useful status line
" set statusline=%f      " current filename
" set statusline+=%=     " align the rest to the right side
" set statusline+=%l/%L  " current line number / total line numbers
"
" exercise 1 - make autogroups to have at least two different status lines
" based on the FileType
function VarExists(var, val)
	if exists(a:var) | return a:val | else | return '' | endif
endfunction
augroup markdown_stl
	autocmd!
	autocmd FileType markdown setlocal statusline=%t           " basename of the current edited file
	autocmd FileType markdown setlocal statusline+=\ -\        " separator
	autocmd FileType markdown setlocal statusline+=[Markdown]  " separator
augroup END
augroup asciidoc_stl
	autocmd!
	autocmd FileType asciidoc setlocal statusline=%t          " basename of the current edited file
	autocmd FileType asciidoc setlocal statusline+=\ -\       " separator
	autocmd FileType asciidoc setlocal statusline+=[Asciidoc] " separator
augroup END
"}}}
" Chapter 18 - responsible coding - 2020-04-11 11:45 {{{
" example 1: use autogroups to enable folding with markers for vim conf files
augroup vimfiles_settings
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" exercise 1 - arrange vimrc in sections - see general section
" exercise 2 - start with all folds closed
augroup vimfile_ex2
	autocmd!
	autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}
" exercise 3 - replace the abbreviated commands in this vimrc with their full
" counterpart - DONE

" vim modeline below
" ft=vim:fdm=marker:fdls=0
