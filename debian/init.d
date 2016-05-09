#!/bin/sh


if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
fi


### BEGIN INIT INFO
# Provides:          btsync
# Required-Start:    $local_fs $remote_fs $syslog
# Required-Stop:     $local_fs $remote_fs $syslog
# Should-Start:      autofs $network
# Should-Stop:       autofs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: BitTorrent Sync
# Description:       BitTorrent Inc. Sync server
### END INIT INFO


DESC="btsync"
DAEMON=/usr/bin/btsync
PIDFILE=/run/btsync/btsync.pid
PIDDIR="$(dirname "$PIDFILE")"
START_ARGS="--config /etc/btsync.conf --log /var/log/btsync/btsync.log"


do_start_prepare()
{
    mkdir --mode 0755 "$PIDDIR"
    chown btsync:btsync "$PIDDIR"
}
