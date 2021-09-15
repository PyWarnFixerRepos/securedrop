#!/bin/sh

# appends HidServAuth values needed for SecureDrop
# authenticated onion services to /etc/tor/torrc.
#
# Configures desktop shortcuts

# Run only when the interace is not "lo":
if [ "$1" = "lo" ]; then
  exit 0
fi

# Run whenever an interface gets "up", not otherwise:
if [ "$2" != "up" ]; then
  exit 0
fi


systemctl stop tor@default
find /var/lib/tor/ -mindepth 1 -delete
/usr/bin/python3 /home/amnesia/Persistent/.securedrop/securedrop_init_pre.py
systemctl start tor@default

