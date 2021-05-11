# .vimrc

yes

## Prerequisites
* [yarnpkg](apt://yarnpkg) package in Ubuntu
* [FuraMono NF](https://github.com/ryanoasis/nerd-fonts) font for GUI (gVim) **can be changed after you clone**

Note: I was told in Arch Linux, `yarnpkg` is called `yarn` and `yarnpkg` works fine. There is no need to replace anything.

## Installation

I clone this repository in some directory, and make a symlink to prevent git warnings. For example:

Cloning this repository in `~` (home) directory
```bash
git clone https://github.com/ronystico/vimrc.git
```

From my Gitlab mirror:
```bash
git clone https://gitlab.com/ronystico/vimrc.git
```

`cd` to the cloned directory
```bash
cd vimrc
```

And make a symlink to `~/.vimrc`
```bash
ln -s ~/vimrc/.vimrc ~/.vimrc
```

**Run vim**

You will be greeted with some warning/errors/bugs/explosions/wowowow but don't worry, I got you covered. You need to quit the warning/e... and write inside vim:
```python
:PlugInstall
```

You need to wait, because `yarnpkg` compiles some plugins written in TypeScript. Go to do another thing while you wait. Ignore the warnings.

After all plugins are done, check that there aren't errors and quit vim.

**Run vim again and you are done. Welcome to my .vimrc**

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
