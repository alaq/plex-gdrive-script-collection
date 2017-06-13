#!/bin/sh

MONITOR="$HOME/activity.log"
. /home/soviel/bin/plexacd.sh

log $1 >> "$MONITOR"
