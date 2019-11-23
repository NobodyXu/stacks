# Print variables for debugging
# Retreveied from:
#     https://stackoverflow.com/a/25817631
print-%  : ; @echo $* = $($*)

#mks := $(shell for each in *; do [ -d $each ] && ls $each | grep '^.*\.mk$'; done)
mks := $(shell find -name '*.mk')
#apt = $(shell which apt-)
#apt = `which apt-fast`
apt := './apt.sh'

include $(mks)
