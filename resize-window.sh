#!/usr/bin/sh

case $1 in
    mid)
        wmctrl -r:ACTIVE: -e 0,1024,1080,3072,1371
        ;;
    left)
        wmctrl -r:ACTIVE: -e 0,4,1080,1024,1371
        ;;
    right)
        wmctrl -r:ACTIVE: -e 0,4096,1080,1024,1371
        ;;
    *)
        echo error
        ;;
esac
