#! /bin/bash

pwd=$(pwd)
cd ~/.local/etc/LEDA-AUTO-SEND  && git pull -f origin master
rm -rf ~/.local/bin/leda
cp -rf ~/.local/etc/LEDA-AUTO-SEND/usr/leda ~/.local/bin
cd "$pwd"
