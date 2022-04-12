# Based on derphilipp/enter-docker-fzf

function __enter_container_id -d "Enter container with provided id"
  set selected_container $argv
  if docker exec "$selected_container" fish >/dev/null
    docker exec --interactive --tty "$selected_container" fish
  else if docker exec "$selected_container" zsh >/dev/null
    docker exec --interactive --tty "$selected_container" zsh
  else if docker exec "$selected_container" bash >/dev/null
    docker exec --interactive --tty "$selected_container" bash
  else
    docker exec --interactive --tty "$selected_container" sh
  end
end

function dke -d "Select Docker container and exec into it"
    set -l cid (__dk_ps_fzf_cid) ; or return 1
    __enter_container_id $cid ; or return 1
end
