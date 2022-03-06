# .vimrc (this README.md needs modification)

yes

## Prerequisites

- `curl`
- `git`
- `yarn` (I install it from npm, but there are distro-specific packages)
- [FuraMono NF](https://github.com/ryanoasis/nerd-fonts) font for GUI (gVim) **can be changed after you clone**

Note: If you use distro-specific packages, I was told that in Arch Linux, `yarnpkg` is called `yarn` and `yarnpkg` works fine. There is no need to replace the string.

## Installation

I clone this repository somewhere, and make a symlink to prevent git warnings. For example:

Cloning this repository in `~` (home) directory

```bash
git clone https://github.com/ronystico/vimrc.git
```

`cd` to the cloned directory

```bash
cd vimrc
```

Make a symlink to `~/.vimrc`

```bash
ln -s ~/vimrc/.vimrc ~/.vimrc
```

**Run vim**

After vim-plug is downloaded, you will be greeted with some warning/errors/bugs/explosions/wowowow but don't worry, I got you covered. You need to quit the warning/e... and run:

```python
:PlugInstall
```

After all plugins are done, check that there aren't errors and quit vim.

**Run vim again and you are done. Welcome to my .vimrc**

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
