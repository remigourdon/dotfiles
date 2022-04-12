function dka -d "Select Docker container to start and attach to"
    set -l cid (__dk_ps_fzf_cid --all)
    if test (count $cid) -eq 1
        docker start $cid && docker attach $cid
    end
end
