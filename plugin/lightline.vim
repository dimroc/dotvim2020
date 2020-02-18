" Inspired and modified from
" https://framagit.org/ivann/dotfiles/blob/acabffd4576cf72125c60c07d2a0d443758bb95b/vim/.config/vim/settings/lightline.vim

scriptencoding utf-8
set encoding=utf-8
set noshowmode
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \           ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]
      \            ]
      \ },
      \ 'inactive' : {
      \   'left': [ [ 'mode' ],
      \             [ 'filename' ]
      \           ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ]
      \            ]
      \ },
      \ 'tabline' : {
      \   'left'  : [ [ 'tabs' ] ],
      \   'right' : [ [ 'close' ], [ 'session' ] ]
      \ },
      \ 'tab' : {
      \   'active' : [ 'tabnum', 'filename', 'fticon', 'modified' ],
      \   'inactive' : [ 'tabnum', 'filename', 'fticon', 'modified' ]
      \ },
      \ 'tab_component_function' : {
      \     'fticon'  : 'LightLineFiletypeIcon'
      \ },
      \ 'component_function' : {
      \   'fugitive'         : 'LightLineFugitive',
      \   'readonly'         : 'LightLineReadonly',
      \   'modified'         : 'LightLineModified',
      \   'filename'         : 'LightLineFilename',
      \   'fileformat'       : 'LightLineFileformat',
      \   'filetype'         : 'LightLineFiletype',
      \   'fileencoding'     : 'LightLineFileencoding',
      \   'mode'             : 'LightLineMode',
      \   'session'          : 'LightLineSession',
      \   'filetypeicon'     : 'LightLineFiletypeIcon',
      \ },
      \ 'component_expand' : {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type' : {
      \   'linter_checking': 'middle',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'middle',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

let g:plugin_filetypes = 'help\|unite\|vimfiler\|gundo\|undotree'

function! LightLineSession()
  return xolox#session#find_current_session()
endfunction

function! LightLineModified()
  return &ft =~# g:plugin_filetypes ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~# g:plugin_filetypes && &readonly ? '' : ''
endfunction

function! LightLineFugitive()
  if &ft !~# g:plugin_filetypes && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  let fname = expand('%')
  return &ft == 'tagbar' ? '' :
        \ &ft == 'undotree' ? '' :
        \ fname == '__Gundo_Preview__' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 && &ft !~# g:plugin_filetypes ? WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 && &ft !~# g:plugin_filetypes ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFiletypeIcon(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fn = expand('#'.buflist[winnr - 1].':t')
  return strlen(fn) ? WebDevIconsGetFileTypeSymbol(fn) : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 && &ft !~# g:plugin_filetypes ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return &ft == 'tagbar' ? 'Tagbar' :
        \ &ft == 'undotree' ? 'Undotree' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 20 ? lightline#mode() : ''
endfunction

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
