#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:$PATH

SERVICE=/etc/init.d/snail-xserver

LOCK_FILE=/tmp/.snail.lock
FIFO_FILE=/tmp/.snail.fifo

$SERVICE stop && snail.nv_pwr_off # stop X service

touch $LOCK_FILE && chown root:video $LOCK_FILE && chmod 660 $LOCK_FILE # create lock file
rm -f $FIFO_FILE && mkfifo --mode 660 $FIFO_FILE && chgrp video $FIFO_FILE # create fifo

{
  echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
  flock -n 9 # make exclusive lock

  while [ 1 ]; do
    read <$FIFO_FILE
    snail.nv_pwr_on && $SERVICE start # starting X server
    flock -u 9
    flock 9
    echo >$FIFO_FILE | cat $FIFO_FILE >/dev/null # flush fifo
    $SERVICE stop && snail.nv_pwr_off # stopping X server
  done
} 9>$LOCK_FILE
