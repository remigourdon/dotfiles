function dkrmi -d "Select Docker images to remove"
    set -l id (__dk_images_fzf_id --multi)
    if test (count $id) -gt 0
        docker rmi $id
    end
end
