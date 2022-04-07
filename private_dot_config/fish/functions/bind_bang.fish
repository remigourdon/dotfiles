# From fish shell wiki
# https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$)

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t -- $history[1]
    commandline -f repaint
  case "*"
    commandline -i !
  end
end
