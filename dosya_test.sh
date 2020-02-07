#!/bin/bash
dialog -infobox "Merhaba dünya" 15 30
read
if [ -f "/usr/bin/vim" ]
  then
  echo "var"
  else
  echo "yok"
fi
