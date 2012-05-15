#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:$PATH

XSERVER_START_CMD=
XSERVER_STOP_CMD=
if [ -f /etc/init.d/snail-xserver ]; then
  XSERVER_START_CMD="/etc/init.d/snail-xserver start"
  XSERVER_STOP_CMD="/etc/init.d/snail-xserver stop"
elif [ -f /etc/systemd/system/snail-xserver.service ]; then
  XSERVER_START_CMD="systemctl start snail-xserver.service"
  XSERVER_STOP_CMD="systemctl stop snail-xserver.service"
else
  echo "Error: snail-xservice not found ;-("
  exit -1
fi

LOCK_FILE=/tmp/.snail.lock
FIFO_FILE=/tmp/.snail.fifo

$XSERVER_STOP_CMD && snail.nv_pwr_off # stop X service

touch $LOCK_FILE && chown root:video $LOCK_FILE && chmod 660 $LOCK_FILE # create lock file
rm -f $FIFO_FILE && mkfifo --mode 660 $FIFO_FILE && chgrp video $FIFO_FILE # create fifo

{
  echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
  flock -n 9 # make exclusive lock

  while [ 1 ]; do
    read <$FIFO_FILE
    echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
    snail.nv_pwr_on && $XSERVER_START_CMD # starting X server
    flock -u 9
    echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
    flock 9
    echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
    $XSERVER_STOP_CMD && snail.nv_pwr_off # stopping X server
  done
} 9>$LOCK_FILE
