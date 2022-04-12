function __dk_images_fzf_id -d "Fuzzy select Docker image(s) ID"
    # Handle options
    set -l options 'm/multi'
    argparse $options -- $argv ; or return

    set --query _flag_multi && set -l fzf_multi '--multi' || set -l fzf_multi '+m'

    set -l preview_command 'docker images --all --filter reference={2} --format "table {{.ID}}\t{{.Tag}}\t{{.CreatedSince}}\t{{.Size}}"'
    docker images --format '{{ .ID }} {{ .Repository }}' --filter dangling=false | fzf -0 $fzf_multi --with-nth 2 --preview "$preview_command" --query "$argv[1]" | string split -f 1 ' '
end

