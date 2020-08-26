all: install_java

install_sdk: install_curl
	sdk --version >/dev/null 2>&1; if [ $? -eq 127 ]; then curl -s "https://get.sdkman.io" | bash; fi

install_java: install_sdk
	sudo $(apt) install -y default-jre default-jdk
	./java/install_gradle.sh
