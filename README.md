# nvim
Personal neovim configurations (Neovim v0.4.4)

Install neovim and clone this repo locally. The directory where it is cloned is referred below as *${CLONE_DIRECTORY}*.

Create a soft link to nvim config in the user's .config directory

```bas
ln -s ${CLONE_DIRECTORY} ~/.config/nvim
```

Create a soft link to the snippets folder in the .vim directory under user home (~):

```bash
ln -s ${CLONE_DIRECTORY}/UltiSnips ~/.vim/UltiSnips
```

