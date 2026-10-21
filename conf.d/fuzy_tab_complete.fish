function __fuzy_tab_complete_install --on-event fuzy_tab_complete_install
    echo "fuzy-tab-complete: installed"
    echo "Add these to your fish_user_key_bindings:"
    echo ""
    echo "  bind \\t __fuzy_tab_complete"
    echo "  bind -M insert \\t __fuzy_tab_complete  # if using vi mode"
end

function __fuzy_tab_complete_uninstall --on-event fuzy_tab_complete_uninstall
    bind -e \t
    bind -e -M insert \t
    echo "fuzy-tab-complete: uninstalled"
end

