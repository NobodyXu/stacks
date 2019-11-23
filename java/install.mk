install_java:
	$(apt) install -y default-jre default-jdk gradle
	# Install gradle completion
	mkdir -p ${HOME}/bash_completion.d
	curl -LA gradle-completion https://edub.me/gradle-completion-bash -o ${HOME}/bash_completion.d/gradle-completion.bash
	echo 'source ${HOME}/bash_completion.d/gradle-completion.bash' >> ~/.bashrc
