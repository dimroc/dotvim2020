## Lean vim/nvim dot files

A leaner cleaner rebuild of [my old dotvim files](https://github.com/dimroc/dotvim) that's compatible with both
vim and nvim. For nvim one must still from vim as [described here](https://neovim.io/doc/user/nvim.html#nvim-from-vim).


### Usage

```bash
$ git clone https://github.com/dimroc/dotvim2020.git
$ cd dotvim2020
$ ./symlink.sh # Created .vim/ and .vimrc symlinks
$ vim . # Then :PlugInstall
$ # Done
```


### Notes

No format support for macvim or gvim. Mostly due to dependency on fzf.
