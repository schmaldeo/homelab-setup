#!/bin/bash
echo "Running on $(date)"
LOOP_DEV=$(sudo losetup -Pf --show "$1")
sudo e2fsck -f -y "${LOOP_DEV}p2"
STATUS=$?
sudo losetup -d "$LOOP_DEV"

if [ $STATUS -eq 0 ] || [ $STATUS -eq 1 ]; then
        cp $1 "$1_checked"
        echo "Check succeeded"
else
        curl -d "IMPORTANT: Corrupt backup detected" "ntfy.sh/$NTFY_TOPIC"
        echo "Check failed"
fi