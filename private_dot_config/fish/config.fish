# Path
fish_add_path $HOME/.fzf/bin

if status is-interactive
    set -g fish_greeting
    [ -f ~/.fzf/shell/key-bindings.fish ] && source ~/.fzf/shell/key-bindings.fish
    starship init fish | source
end
