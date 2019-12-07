# Print variables for debugging
# Retreveied from:
#     https://stackoverflow.com/a/25817631
print-%  : ; @echo $* = $($*)

# Variable Definitions
mks := $(shell find -L -name '*.mk')
apt := './apt.sh'
su_orig := './su_orig.sh'
append := './append.sh'
cp_to_home := './cp_to_home.sh'

# Target Definitions
all: install_apt-fast
	
wsl: all

include $(mks)
