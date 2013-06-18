#!/bin/sh
#
# USAGE: udev-unmounter.sh MOUNTPT
#   MOUNTPT is a mountpoint we want to unmount and delete.
#
# This file goes in /usr/local/sbin/udev-unmounter.sh
# Called by /etc/udev/rules.d/89-local.rules

MOUNTPT="$1"

if [ -z "$MOUNTPT" ]; then
   exit 1
fi


# test mountpoint - it should exist
if [ -e "${MOUNTPT}" ]; then

   # very naive; just run and pray
   umount -l "${MOUNTPT}" && rmdir "${MOUNTPT}" && exit 0

   echo "error: ${MOUNTPT} failed to unmount."
   exit 1
fi

echo "error: ${MOUNTPT} does not exist"
exit 1
