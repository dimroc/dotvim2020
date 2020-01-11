" Further modifications are in the ./plugin/ folder

call plug#begin('~/.vim/plugged')

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'hhvm/vim-hack'
Plug 'jlfwong/vim-mercenary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/keepcase.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

call plug#end()

colorscheme base16-default-dark
