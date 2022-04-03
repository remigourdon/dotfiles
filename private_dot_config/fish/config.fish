if status is-interactive
    set -U fish_greeting
    [ -f ~/.fzf/shell/key-bindings.fish ] && source ~/.fzf/shell/key-bindings.fish
    starship init fish | source
end
