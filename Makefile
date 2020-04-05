update-tmux-plugin-manager:
	curl -s -L -o tpm-master.tar.gz https://github.com/tmux-plugins/tpm/archive/master.tar.gz
	chezmoi import --strip-components 1 --destination ${HOME}/.tmux/plugins/tpm tpm-master.tar.gz
