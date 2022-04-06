# Add FZF to path
fish_add_path $HOME/.fzf/bin

if status is-interactive

    # Disable fish greeting
    set -g fish_greeting

    # Load FZF keybindings function
    [ -f ~/.fzf/shell/key-bindings.fish ] && source ~/.fzf/shell/key-bindings.fish

    # Enable asdf
    if [ -d "${HOME}/.asdf" ]
        source ~/.asdf/asdf.fish
        asdf exec direnv hook fish | source
    end

    # Use starship for the prompt
    starship init fish | source

end
