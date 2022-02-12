#!/usr/bin/sh
#
# $HOME/.zprofile
#
# Order of Operations: .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout
#
# Similarly to `.zlogin`, this file is sourced on the start of a login shell but
#  before .zshrc if the shell is also interactive. Since this is inspired by how
#  `bash` uses `.bash_profile`, I use it to put the common environment settings
#  that would work for any shell. The actual settings are in a shell neutral 
source ~/.config/shell/profile
