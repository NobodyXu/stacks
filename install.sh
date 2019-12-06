#!/bin/bash

[ -z "$ORIG_USER" ] && ORIG_USER=$USER
[ "$ORIG_USER" = "root" ] && ORIG_HOME=/root || ORIG_HOME=/home/$ORIG_USER

#exec sudo env ORIG_HOME=$ORIG_HOME ORIG_USER=$ORIG_USER DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS make $1
exec make $1
