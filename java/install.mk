all: install_java

install_java:
	sudo $(apt) install -y default-jre default-jdk gradle
	./java/install_gradle_completion.sh
