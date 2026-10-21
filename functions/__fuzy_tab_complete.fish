function __fuzy_tab_complete
    set -l cmd (commandline)
    set -l completions (complete -C "$cmd")

    if test (count $completions) -eq 0
        return
    end

    if test (count $completions) -eq 1
        commandline -rt (string split \t -- $completions[1])[1]
        return
    end

    # Configurable options with defaults
    set -l height (set -q FUZY_TAB_HEIGHT; and echo $FUZY_TAB_HEIGHT; or echo "40%")
    set -l min_height (set -q FUZY_TAB_MIN_HEIGHT; and echo $FUZY_TAB_MIN_HEIGHT; or echo "10")
    set -l layout (set -q FUZY_TAB_LAYOUT; and echo $FUZY_TAB_LAYOUT; or echo "reverse-list")
    set -l preview_enabled (set -q FUZY_TAB_PREVIEW; and echo $FUZY_TAB_PREVIEW; or echo "1")
    set -l preview_position (set -q FUZY_TAB_PREVIEW_POSITION; and echo $FUZY_TAB_PREVIEW_POSITION; or echo "right:40%")
    set -l list_label (set -q FUZY_TAB_LIST_LABEL; and echo $FUZY_TAB_LIST_LABEL; or echo " Completions ")
    set -l input_label (set -q FUZY_TAB_INPUT_LABEL; and echo $FUZY_TAB_INPUT_LABEL; or echo " Search ")

    set -l color_scheme (set -q FUZY_TAB_COLORS; and echo $FUZY_TAB_COLORS; or echo "border:#88aaff,list-border:#55bb55,input-border:#bb5555,label:#ffffff,list-label:#55bb55,input-label:#bb5555,prompt:#88aaff,pointer:#ffaa44,marker:#55bb55,spinner:#ffffff,info:#88aaff")

    set -l fzf_args \
        --height $height --min-height $min_height \
        --layout=$layout \
        --style full:rounded \
        --border rounded --padding 0,1 \
        --list-border rounded \
        --input-border rounded \
        --wrap \
        --input-label "$input_label" \
        --list-label "$list_label" \
        --delimiter=\t \
        --with-nth=1.. \
        --color="$color_scheme" \
        --bind 'tab:down,shift-tab:up'

    if test "$preview_enabled" = "1"
        set -a fzf_args \
            --preview 'test -e {} && bat --color=always --style=numbers --line-range=:30 {} 2>/dev/null || test -d {} && ls --color=always {} 2>/dev/null || echo {}' \
            --preview-window=$preview_position:border-rounded:wrap
    else
        set -a fzf_args --preview-window=hidden
    end

    set -l result (printf '%s\n' $completions | fzf $fzf_args)

    if test -n "$result"
        commandline -rt (string split \t -- $result)[1]
    end

    commandline -f repaint
end

