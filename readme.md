# Install
```
git clone https://github.com/hdra/vimrc ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc

ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
ln -s ~/.vim ~/.config/nvim
```

# Setup Python Paths

Setup Python path for neovim, set the path to the respective python path
with the `neovim` pip package installed (also works for virtualenv path):

    let g:python_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'

Also setup the path to flake8 path:

    let g:flake8_cmd="/Users/hndr/.virtualenvs/flake8/bin/flake8"


# Additional Binaries

## C-Tags

`brew install ctags`


## Go-Vim

run `:GoInstallBinaries` within vim


## Javascript lints
Neomake is configured to use eslint.

`npm install -g eslint`
`npm install -g babel-eslint`
`npm install -g eslint-plugin-react`


## YCM

https://github.com/Valloric/YouCompleteMe

Basically, run:

`cd ~/.vim/bundle/YouCompleteMe`
`./install.py --clang-completer --gocode-completer --tern-completer`


## Silver Searcher

`brew install the_silver_searcher`

