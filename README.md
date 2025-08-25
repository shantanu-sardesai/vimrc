# Setup instructions

<!-- TODO: Add a separate repository for the rest of the dotfiles.
        1. Install instructions would then just contain generating appropriate
        symlinks.
        2. Create a submodule for vimrc. -->

### Download the setup

> Make sure to take a backup of your `nvim` config.

```sh
cd ~/.config
git clone https://github.com/shantanu-sardesai/vimrc.git nvim
```

### Download the dependencies

<!-- TODO: Add a script for installation. -->

```sh
# fd -- for snacks.
# ripgrep -- for search in telescope.
brew install fd ripgrep
```
