#!/bin/bash
# Configure external repositories
set -Eeuo pipefail

config_local() {
    local dest="${1}"
    (
        cd "${dest}"
        git config --local user.name remigourdon
        git config --local user.email gourdon.remi@gmail.com
    )
}

clone_repo() {
    local repo="${1}"
    local dest="${2}"
    if [ -e "${dest}" ] ; then
        return 1
    fi
    echo "Configuring ${repo} in ${dest}"
    git clone "${repo}" "${dest}" && config_local "${dest}"
}

config_local "$(chezmoi source-path)"

declare -A REPOS
REPOS["git@github.com:remigourdon/scripts.git"]="${HOME}/.scripts"
REPOS["git@github.com:remigourdon/cheats.git"]="${HOME}/.cheats"
REPOS["git@github.com:remigourdon/snippets.git"]="${HOME}/.snippets"

for repo in "${!REPOS[@]}" ; do
    clone_repo "${repo}" "${REPOS[${repo}]}" || true
done
