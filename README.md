# Castlne
bannzai's castle. :japanese_castle:

# Require
Using [homeshick](https://github.com/andsens/homeshick).
```bash
$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
```

# Clone :japanese_castle:
```bash
$ homeshick clone bannzai/castle
```

# Link :japanese_castle:
```bash
$ homeshick symlink castle
```
When you already prepare any `dotfiles` or `rc` and so on.
You get to resolve `--skip` option.
```bash
$ homeshick symlink castle --skip
```

# Bootstrap
```bash
$ curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/bannzai/castle/master/bootstrap.sh | bash
```
