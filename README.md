Tmux Session Manager
====================

Installation
------------

### zplug

```
zplug "RobertAudi/tsm"
```

### As a plugin

```shell
$ source "tsm.plugin.zsh"
```

### Manually

For a "stable" version:

- Put `dist/bin/tsm` in a directory in your `$PATH`
- Put `dist/functions/_tsm` in a directory in your `$FPATH` (optional)

For the latest version:

- Run `./build.zsh`
- Put `build/tsm` in a directory in your `$PATH`
- Put `share/zsh/_tsm` in a directory in your `$FPATH` (optional)

Requirements
------------

- `tmux` (Tested versions: **2.3**)
- `zsh` (Tested versions: **5.2**, **5.3**)
- 256 colors support
- \*nix (Tested OS: macOS Sierra **10.12**)

Usage
-----

```shell
$ tsm <COMMAND> [args...]
```

Configuration
-------------

- `$TSM_HOME` (**default:** `$HOME/.tmux/tmux-sessions`)
- `$TSM_SESSIONS_DIR` (**default:** `$TSM_HOME/sessions`)
- `$TSM_BACKUPS_DIR` (**default:** `$TSM_HOME/backups`)
- `$TSM_DEFAULT_SESSION_FILE` (**default:** `$TSM_HOME/default-session.txt`)
- `$TSM_BACKUPS_COUNT` (**default:** `20`)

Commands
--------

- [x] `list`
- [x] `show`
- [x] `save`
- [x] `restore`
- [x] `resume`
- [x] `quit`
- [ ] `backup`
- [ ] `cleanup`
- [x] `help`
- [ ] `edit`
- [ ] `remove`
- [ ] `duplicate`
- [x] `rename`

TODO
----

- [ ] Man pages
- [ ] Configuration file
- [x] ASCII Art logo

Credits
-------

- [`tmux-session`][tmux-session-mislav] by [Mislav Marohnić][gh-mislav] ([@mislav][gh-mislav]) was used as a starting point for this project.
- Lots of inspiration from [zplug][gh-zplug]

[tmux-session-mislav]: https://github.com/mislav/dotfiles/blob/62ca947b2cc39453a9f06d601dc00f85708995d9/bin/tmux-session
[gh-mislav]: https://github.com/mislav
[gh-zplug]: https://github.com/zplug/zplug

License
-------

[MIT](LICENSE.txt)
