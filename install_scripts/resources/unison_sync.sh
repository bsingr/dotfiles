#!/bin/bash
pid=`pgrep unison`
mount_afp afp://aiport.qpree.com/Data /Volumes/Data
[ -z $pid ] && $HOME/bin/unison -auto -batch
