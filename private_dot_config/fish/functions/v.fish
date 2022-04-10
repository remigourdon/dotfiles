function v -d "Open vim on fasd file match"
    set -l file (fasd -flR | fzf -0 -1 --preview 'bat --color=always {}')
    if test -n "$file"
        vi "$file"
    end
end
