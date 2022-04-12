function __dk_ps_fzf_cid -d "Fuzzy select Docker container(s) ID"
    # Handle options
    set -l options 'a/all' 'm/multi'
    argparse $options -- $argv ; or return

    set --query _flag_all && set -l ps_all '--all'
    set --query _flag_multi && set -l fzf_multi '--multi' || set -l fzf_multi '+m'

    set -l preview_command 'docker ps --all --filter id={1} --format "table {{.Image}}\t{{.Status}}\t{{.RunningFor}}"'
    docker ps $ps_all --format '{{ .ID }} {{ .Names }}' | fzf -0 $fzf_multi --with-nth 2 --preview "$preview_command" --query "$argv[1]" | string split -f 1 ' '
end
