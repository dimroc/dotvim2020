" Further modifications are in the ./plugin/ folder

call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hhvm/vim-hack'
Plug 'itchyny/lightline.vim'
Plug 'jlfwong/vim-mercenary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/file-line'
Plug 'vim-scripts/keepcase.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

colorscheme base16-tomorrow-night
