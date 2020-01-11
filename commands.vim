let mapleader = ","

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
