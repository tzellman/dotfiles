# dotfiles

tzellman's configuration files for bash, git, tmux, etc.

## Installation

Clone somewhere, then run the `install` script:

```sh
$ git clone git://github.com/tzellman/dotfiles.git ~/dotfiles
$ ~/dotfiles/install

# to force overriding your exisiting files pass -f or --force
$ ~/dotfiles/install -f 
```

Your existing files will not be replaced unless you --force/-f.

## Misc. commands in `bin`

Check [the `bin` directory](https://github.com/tzellman/dotfiles/tree/master/bin) for awesome commands such as:

- git-unreleased
- tmux-session

## git


## tmux

- `C-h/j/k/l` - switch to pane in the given direction
- `C-\\` - toggle between last active panes

Under tmux prefix `C-a`:

- `C-l` - clear terminal
- `S` - switch to a session that starts with given name, or switch to the last
  session if no name given
- `r` - source `~/.tmux.conf` after changes

Regular tmux keybindings:

    % vertical split
    " horizontal split
    ! break pane into new window
    c new window

    o select next pane
    { swap pane with previous
    } swap pane with next
    n next window
    p previous window
    ) next session
    ( previous session
    ; select previously active pane
    l select previously active window

    s interactive session & window browser
    w interactive window browser

    $ rename session
    , rename window

    : command prompt
    d detach
    f search text in open windows

    [ copy mode
    ] paste buffer
    # list buffers
    - delete buffer

