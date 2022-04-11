# Add FZF to path
fish_add_path $HOME/.fzf/bin

if status is-interactive

    # Disable fish greeting
    set -g fish_greeting

    # Load FZF keybindings function
    if [ -f ~/.fzf/shell/key-bindings.fish ]
        source ~/.fzf/shell/key-bindings.fish
        if command -v fd &>/dev/null
            set -gx FZF_DEFAULT_COMMAND "fd"
            set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
            set -gx FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"
        end
        set -gx FZF_DEFAULT_OPTS "
          --layout=reverse
          --info=inline
          --height=80%
          --prompt='∼ ' --pointer='▶' --marker='✓'
          --bind '?:toggle-preview'
          --bind 'ctrl-a:select-all'
          --bind 'ctrl-alt-a:deselect-all'
          --bind 'ctrl-y:execute-silent(echo {+} | wl-copy)'
          --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
          --bind 'ctrl-v:execute(code {+})'
        "
    end

    # Enable asdf
    if [ -d "$HOME/.asdf" ]
        source "$HOME/.asdf/asdf.fish"
        asdf exec direnv hook fish | source
    end

    # Use starship for the prompt
    starship init fish | source

end
