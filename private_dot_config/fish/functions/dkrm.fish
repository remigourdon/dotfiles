function dkrm -d "Select Docker containers to remove"
    # Handle options
    set -l options 'f/force'
    argparse $options -- $argv ; or return

    set --query _flag_force && set -l rm_force '--force'

    set -l cid (__dk_ps_fzf_cid --all --multi)
    if test (count $cid) -gt 0
        docker rm $rm_force $cid
    end
end
