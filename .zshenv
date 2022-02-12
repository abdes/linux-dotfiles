#!/usr/bin/sh
#
# $HOME/.zlogin
#
# Order of Operations: .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout
#
# This is read first and read every time. This is where you set environment
# variables that may be useful to scripts run in non-interactive shells, such as
# $PATH, $PAGER, or $EDITOR, etc...
#
# I don't use this file because I prefer to set the environment variables in my
# script itself to ensure portability.
