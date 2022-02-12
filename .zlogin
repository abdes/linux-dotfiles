#!/usr/bin/sh
#
# $HOME/.zlogin
#
# Order of Operations: .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout
#
# This file is sourced on the start of a login shell but after .zshrc if the
#  shell is also interactive. This file is often used to start X using startx,
#  but often login is handled by a display manager, rendering this file not very
#  useful.
#
# I use it to launch external commands that only need to be run one for the user
#  login and do not modify the shell behavior; e.g. starting `mpd` as a suer
#  service.
#echo ".zlogin"

systemctl --user start mpd.service
