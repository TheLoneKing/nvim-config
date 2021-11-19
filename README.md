# nvim

Personal neovim configurations (Neovim v0.4.4)

* [Configuring Neovim](#configuring-neovim)
* [Install Plugins](#install-plugins)
* [Coc Extensions](#coc-extensions)

Install neovim and clone this repo locally. The directory where it is cloned is referred below as *${CLONE_DIRECTORY}*.

## Configuring Neovim
**Step 1**: Create a soft link to nvim config in the user's .config directory
```bash
ln -s ${CLONE_DIRECTORY} ~/.config/nvim
```
**Step 2**: Create a soft link to the snippets folder in the .vim directory under user home (~):
```bash
ln -s ${CLONE_DIRECTORY}/UltiSnips ~/.vim/UltiSnips
```

## Install Plugins
Open the `init.vim` file and run `:PlugInstall` command to install all the plugins.

## Coc Extensions
This configuration has the following CoC extensions enabled:
<ul>
    <li>coc-css</li>
    <li>coc-eslint</li>
    <li>coc-html</li>
    <li>coc-java</li>
    <li>coc-json</li>
    <li>coc-pyright</li>
    <li>coc-python</li>
    <li>coc-sh</li>
    <li>coc-sql</li>
    <li>coc-tsserver</li>
    <li>coc-yaml</li>
    <li>coc-xml</li>
</ul>

Once the plugins are installed, install the coc extensions with the below command:
```viml
:CocInstall coc-css coc-eslint coc-html coc-java coc-json coc-pyright coc-python coc-sh coc-sql coc-tsserver coc-yaml coc-xml
```

