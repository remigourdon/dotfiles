function fish_user_key_bindings

    # FZF
    fzf_key_bindings

    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict
    fish_vi_key_bindings --no-erase insert

end
