#!/usr/bin/sh
#
# $HOME/.zlogout
#
# Order of Operations: .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout
#
# This file is sourced when exiting from the login shell. I use it to reverse
#  the effects of actions taken in `.zlogin`.
echo ".zlogout"

systemctl --user stop mpd.service
