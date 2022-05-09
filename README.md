# Arsalan Kazmi's Neovim config

This is a hand-crafted config for Neovim, inspired by SpaceVim and DOOM Emacs.

Leader key bindings take after DOOM Emacs, using mnemonics, and Emacs-style editing commands have been implemented.

## Installing
```sh
# On *nix systems
git clone git@github.com:That1M8Head/nvim.git $HOME/.config/nvim/init.vim
```
```bat
rem On Windows
git clone git@github.com:That1M8Head/nvim.git %USERPROFILE%/.config/nvim/init.vim
```
If you're on Windows, create an `init.vim` file at `%appdata%\nvim\` and write the following inside it:
```sh
source ~/.config/nvim/init.vim
```

You should run `:PlugInstall` or `<SPC>pp` inside Neovim after cloning the repo.

## Using it in regular Vim
For the most part, this will still work under standard Vim, so you can still clone it to `.vim` if you wanted. This will likely change in future, especially if I start to go down the `init.lua` route.
