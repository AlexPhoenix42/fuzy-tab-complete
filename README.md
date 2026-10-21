# fuzy-tab-complete

Replace Fish shell's default Tab completion pager with a styled [fzf](https://github.com/junegunn/fzf) dropdown.

Part of the [fuzy-tools](https://github.com/AlexPhoenix42) suite.

## Features

- Replaces the boring built-in Fish pager with fzf
- Rounded borders with labeled sections
- File preview with [bat](https://github.com/sharkdp/bat) syntax highlighting
- Directory preview with `ls`
- Wrapping for long descriptions
- Fully configurable colors, layout, and preview
- Works alongside [jethrokuan/fzf](https://github.com/jethrokuan/fzf) and other fzf plugins

## Requirements

- [Fish](https://fishshell.com/) >= 3.4.0
- [fzf](https://github.com/junegunn/fzf) >= 0.60.0 (for `--style` and `--list-border`)
- [bat](https://github.com/sharkdp/bat) (optional, for file previews)
- [Fisher](https://github.com/jorgebucaran/fisher)

## Install

```fish
fisher install alexphoenix42/fuzy-tab-complete
```

Then add to your `~/.config/fish/functions/fish_user_key_bindings.fish`:

```fish
function fish_user_key_bindings
    # your other bindings...
    bind \t __fuzy_tab_complete
    bind -M insert \t __fuzy_tab_complete  # if using vi mode
end
```

## Uninstall

```fish
fisher remove alexphoenix42/fuzy-tab-complete
```

## Configuration

All options are set via environment variables in your `config.fish`. Defaults are shown below.

### Layout

```fish
set -g FUZY_TAB_HEIGHT "40%"
set -g FUZY_TAB_MIN_HEIGHT "10"
set -g FUZY_TAB_LAYOUT "reverse-list"
```

### Labels

```fish
set -g FUZY_TAB_LIST_LABEL " Completions "
set -g FUZY_TAB_INPUT_LABEL " Search "
```

### Preview

```fish
set -g FUZY_TAB_PREVIEW "1"              # set to "0" to disable
set -g FUZY_TAB_PREVIEW_POSITION "right:40%"
```

### Colors

```fish
set -g FUZY_TAB_COLORS "border:#88aaff,list-border:#55bb55,input-border:#bb5555,label:#ffffff,list-label:#55bb55,input-label:#bb5555,prompt:#88aaff,pointer:#ffaa44,marker:#55bb55,spinner:#ffffff,info:#88aaff"
```

## License

[GPL3](LICENSE)

