all: install_java

install_java:
	$(apt) install -y default-jre default-jdk gradle
	$(su_orig) ./java/install_gradle_completion.sh
