# Install
```
git clone git@github.com:hdra/vimrc.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
```

# Setup Python Paths

Setup Python path for neovim, set the path to the respective python path
with the `neovim` pip package installed (also works for virtualenv path):

    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

Also setup the path to flake8 path:

    let g:flake8_cmd="/Users/hndr/.virtualenvs/flake8/bin/flake8"


# Additional Binaries

```
npm install -g typescript typescript-language-server svelte-language-server
```



## Javascript lints
Neomake is configured to use eslint.

`npm install -g eslint`
`npm install -g babel-eslint`
`npm install -g eslint-plugin-react`



* Clone the Elixir LS `https://github.com/elixir-lsp/elixir-ls`
* Build it. `mix compile` and `mix elixir_ls.release`
* Point the YCM ls to the release

```
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'elixir',
  \     'cmdline': [ '/Users/hndr/Code/Elixir/elixir-ls/release/language_server.sh' ],
  \     'filetypes': [ 'elixir' ]
  \   }
  \ ]
```

## Ripgrep
```
$ brew tap burntsushi/ripgrep https://github.com/BurntSushi/ripgrep.git
$ brew install ripgrep-bin
```
