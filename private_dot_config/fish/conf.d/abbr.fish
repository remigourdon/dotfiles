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
abbr -ga gs 'git status'
abbr -ga gl 'git log --all --decorate --oneline --graph'
abbr -ga gd 'git diff'
abbr -ga ga 'git add'
abbr -ga gaa 'git add .'
abbr -ga gap 'git add --patch'
abbr -ga gb 'git branch'
abbr -ga gc 'git commit'
abbr -ga gco 'git checkout'
abbr -ga gco 'git clean'
abbr -ga gcm 'git commit --message'
abbr -ga gca 'git commit --amend'
abbr -ga gri 'git rebase --interactive'

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
abbr -ga dkps 'docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.RunningFor}}"'
abbr -ga dkrm 'docker rm --force'
abbr -ga dkrmi 'docker rmi'
abbr -ga dkls 'docker container ls'
abbr -ga dklsi 'docker image ls'
abbr -ga dkterm 'docker exec --tty --interactive'
