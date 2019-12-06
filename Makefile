# Print variables for debugging
# Retreveied from:
#     https://stackoverflow.com/a/25817631
print-%  : ; @echo $* = $($*)

#mks := $(shell for each in *; do [ -d $each ] && ls $each | grep '^.*\.mk$'; done)
mks := $(shell find -name '*.mk')
#apt = $(shell which apt-)
#apt = `which apt-fast`
apt := './apt.sh'
su_orig := './su_orig.sh'
append:= './append.sh'
cp_to_home := './cp_to_home.sh'

all: install_apt-fast
	
wsl: all

include $(mks)
