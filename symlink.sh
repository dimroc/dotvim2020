#!/usr/bin/env bash

dotfiles=(vimrc)
source="$( cd "$(dirname "$0")" ; pwd -P )"

echo Creating symlink for ~/.vim to $source

rm -rf ~/.vim || true
ln -s "${source}" ~/.vim

echo Symlinking the following dotfiles:

cd ~
for dotfile in "${dotfiles[@]}"; do
  rm -f ".${dotfile}"
  echo "- ~/.${dotfile} -> $source/${dotfile}"
  ln -s "$source/${dotfile}" ".${dotfile}"
done
