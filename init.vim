" Neovim initialization file.

" General neovim configuration.
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/keys.vim

" Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'google/vim-searchindex'   " Displays match count while searching
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'  " Searches the files recursively for given text
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter' " Toggle comment/uncomment
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'   " Denotes changes in the file
    Plug 'tpope/vim-fugitive'
    Plug 'puremourning/vimspector'
" Syntax
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
    Plug 'uiiaoo/java-syntax.vim'
    Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlight
" Visuals / Color-scheme / Theme
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " vim-devicons plugin may need additional fonts to work properly.
    " Skip this plugin if not needed. This is just a cosmetic plugin.
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" Plugin configuration
source ~/.config/nvim/nerdtree/nerdtree.vim
source ~/.config/nvim/nerdtree/nerdtree-git.vim
source ~/.config/nvim/nerdcommenter/nerdcommenter.vim
source ~/.config/nvim/ctrlp/ctrlp.vim
source ~/.config/nvim/git/gitgutter.vim
source ~/.config/nvim/git/fugitive.vim
source ~/.config/nvim/snippet/ultisnips.vim
source ~/.config/nvim/coc/coc.vim
source ~/.config/nvim/coc/extensions.vim
source ~/.config/nvim/vimspector/vimspector.vim
source ~/.config/nvim/gruvbox/gruvbox.vim
source ~/.config/nvim/airline/airline.vim

" Set color scheme
colorscheme gruvbox

