#!/bin/bash

# Install Grub

SCRIPT_DIR="$(cd -P "$(dirname "$BASH_SOURCE")" && pwd)"
cd $SCRIPT_DIR
. set.sh

DISK=$1

sed -i -e 's/message=/message_null=/g' /etc/grub.d/10_linux

cat <<EOF>> /etc/default/grub
GRUB_TIMEOUT=0
GRUB_RECORDFAIL_TIMEOUT=0
GRUB_TERMINAL=console
GRUB_DISTRIBUTOR=``
GRUB_DISABLE_OS_PROBER=true
GRUB_DISABLE_SUBMENU=y
EOF

update-grub
grub-install $DISK
