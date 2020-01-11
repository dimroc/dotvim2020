let mapleader=","

map <leader>p :FZF<CR>
map <leader>f :FZF<CR>
map <leader>h :History<CR>
map <leader>u :UndotreeToggle<CR>

" Bookmarks
map <leader>b :BookmarkAnnotate<CR>
map <leader>B :BookmarkShowAll<CR>

" Shortcuts for ALE
map <c-d> :ALENext<CR>
map <c-f> :ALEPrevious<CR>

" Shortcut to close all other tabs and windows
command Ont exec 'only|tabo'

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" go to definition
map gd :call CocActionAsync('jumpDefinition')<CR>

" Shortcut to OpenSession, SaveSession taken from
" https://github.com/xolox/vim-session/blob/9e9a6088f0554f6940c19889d0b2a8f39d13f2bb/plugin/session.vim#L169
command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names OS call xolox#session#open_cmd(<q-args>, <q-bang>, 'OpenSession')
command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names_with_suggestions SS call xolox#session#save_cmd(<q-args>, <q-bang>, 'SaveSession')
