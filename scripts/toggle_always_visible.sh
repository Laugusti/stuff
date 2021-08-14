#!/bin/sh
wmctrl -ir $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f2) -b toggle,sticky
