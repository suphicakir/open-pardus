#!/bin/bash
DURUM=0
function check_app () {
if [ -f "/usr/bin/nano" ]
  then
    DURUM=1
  else
    DURUM=0
fi
echo $DURUM
}
check_app
