#!/bin/bash

# (assumes you have puush installed correctly)
# this will use byzanz to record a gif, then upload it using puush
# currently setup to record 1600 by 900 screen

# usage:
# .createGif.sh {duration in seconds}

TempName=`date | md5sum`
TempName=${TempName::-5}.gif

# will use default 5 seconds if no duration is input
byzanz-record -c --x=0 --y=0 --width=1600 --height=900 -d ${1:-5} ~/.gifs/$TempName

echo "GIF created: ~/.gifs/$TempName"

~/puush/puush-linux/puush ~/.gifs/$TempName

# primitive delete, removes old gifs if there are more than 5 in the directory
gifcount=$(find ~/.gifs/ -maxdepth 1 -type f -name '*.gif' | wc -l)
if [ $gifcount -gt 4 ] ; then
    rm ~/.gifs/*
fi
