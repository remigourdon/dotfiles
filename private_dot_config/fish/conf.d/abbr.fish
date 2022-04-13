# Verbose for safety
abbr -ga rm 'rm -i'
abbr -ga cp 'cp -i'
abbr -ga mv 'mv -i'

# ls and exa
if command -v exa >/dev/null 2>&1
    abbr -ga ls 'exa --group-directories-first'
    abbr -ga ll 'exa --group-directories-first --long'
    abbr -ga la 'exa --group-directories-first --long --all'
else
    abbr -ga ls 'ls --color=auto --group-directories-first'
    abbr -ga ll 'ls --color=auto --group-directories-first -l --human-readable'
    abbr -ga la 'ls --color=auto --group-directories-first -l --all --human-readable'
end

# lsblk
abbr -ga lk 'lsblk'

# grep
abbr -ga grep 'grep --color=auto'

# diff
abbr -ga diff 'diff --unified --color=auto'

# git
abbr -ga g 'git'
abbr -ga gs 'cowsay -f tux "Put git aliases in your muscle memory!"'

# tmux
abbr -ga tml 'tmux list-sessions'
abbr -ga tma 'tmux attach-session -t'
abbr -ga tmk 'tmux kill-session -t'
abbr -ga tmn 'tmux new-session -A -s'

# udiskie
abbr -ga udm 'udiskie-mount --recursive'
abbr -ga udu 'udiskie-umount --force'
abbr -ga udua 'udiskie-umount --all'
abbr -ga udd 'udiskie-umount --force --detach'
abbr -ga udda 'udiskie-umount --all --detach'

# Docker
abbr -ga dkls 'docker container ls'
abbr -ga dklsi 'docker image ls'

# jless
abbr -ga yless 'jless --yaml'
