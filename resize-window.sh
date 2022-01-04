#!/usr/bin/sh

# Declare variables

SCREEN1WIDTH=5120
SCREEN1HEIGHT=1440
SCREEN2WIDTH=1920  # Not used
SCREEN2HEIGHT=1080
MASTERPANELPERC=6 # expressed out of 10
WIDTHDIFF=0
HEIGHTDIFF=69
BORDER=6
G=0

# set Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
# set Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'y' -f1)

# Calculate Master and Slave widths
SLAVEPANELPERC=$((10-MASTERPANELPERC))
BORDEROFFSET=$((BORDER*2))
MASTERWIDTH=$(($((SCREEN1WIDTH*MASTERPANELPERC/10))-BORDEROFFSET-BORDER))
SLAVEWIDTH=$(($((SCREEN1WIDTH*SLAVEPANELPERC/10/2))-BORDEROFFSET))

# Calculate X,Y,W,H
XLEFT=$((0+BORDER))
XMID=$((XLEFT+SLAVEWIDTH+BORDEROFFSET))
XRIGHT=$((SCREEN1WIDTH-BORDEROFFSET-SLAVEWIDTH))
Y=$((SCREEN2HEIGHT+BORDER))
H=$((SCREEN1HEIGHT-HEIGHTDIFF-BORDEROFFSET))
# echo x:$Xaxis y:$Yaxis

# Print geometry
echo Left x:$XLEFT y:$Y w:$SLAVEWIDTH h:$H
echo Mid x:$XMID y:$Y w:$MASTERWIDTH h:$H
echo Right x:$XRIGHT y:$Y w:$SLAVEWIDTH h:$H

# Take command line argument to determine placement on screen
case $1 in
    mid)
        wmctrl -r:ACTIVE: -e $G,$XMID,$Y,$MASTERWIDTH,$H
        ;;
    left)
        wmctrl -r:ACTIVE: -e $G,$XLEFT,$Y,$SLAVEWIDTH,$H
        ;;
    right)
        wmctrl -r:ACTIVE: -e $G,$XRIGHT,$Y,$SLAVEWIDTH,$H
        ;;
    *)
        echo error
       ;;
esac
