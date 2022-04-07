function fish_user_key_bindings

    # Bindings
    bind --mode insert \cw forward-word

    # Bash Style Command Substitution and Chaining
    # https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$)
    bind --mode insert ! bind_bang
    bind --mode insert '$' bind_dollar

    # FZF
    fzf_key_bindings

    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict
    fish_vi_key_bindings --no-erase insert

end
