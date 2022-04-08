function z -d "Change directory to first match"
    if count $argv > 0
        fasd_cd -d "$argv"
    else
        cd (command fasd -Rdl $argv[1] | fzf -1 -0 --no-sort +m)
    end
end
