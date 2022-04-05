function ssht -d "Connect to remote and attach tmux session"
    if test (count $argv) -eq 1
        ssh -t "$argv[1]" TERM=xterm-256color tmux new-session -A -s remi
    else if test (count $argv) -eq 2
        ssh -t "$argv[1]" TERM=xterm-256color tmux new-session -A -s "$argv[2]"
    end
end
