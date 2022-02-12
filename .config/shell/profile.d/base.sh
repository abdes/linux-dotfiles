#!/bin/sh

ProfileBaseAlias() {
    alias 'chmod=/bin/chmod -v'
    alias 'chown=/bin/chown -v'
    alias 'cp=/bin/cp -v'
    alias 'df=/bin/df -h'
    alias 'dir=/bin/dir -h --color=never'
    alias 'du=/usr/bin/du -h'
    alias 'egrep=/bin/grep -E --color=auto'
    alias 'fgrep=/bin/grep -F --color=auto'
    alias 'grep=/bin/grep --color=auto'
    alias 'ln=/bin/ln -v'
    alias 'ls=/bin/ls -h --color=auto'
    alias 'mkdir=/bin/mkdir -v'
    alias 'mount=/bin/mount -v'
    alias 'mv=/bin/mv -v'
    alias 'nohup=/usr/bin/nohup '
    alias 'rgrep=/bin/grep -r --color=auto'
    alias 'rm=/bin/rm -v'
    alias 'rsync=/usr/bin/rsync -v'
    alias 'umount=/bin/umount -v'
    alias 'vdir=/bin/vdir -h --color=never'

    alias 'll=ls -l'
    alias 'lla=ls -al'
}

ProfileBaseLocale() {
    LANG=en_US.UTF-8

    #LC_ALL=
    LC_COLLATE=C
    LC_CTYPE=$LANG
    #LC_MESSAGES=
    #LC_NUMERIC=
    LC_TIME=C

    export \
        LANG \
        LC_COLLATE \
        LC_CTYPE \
        LC_TIME
}

ProfileBaseTz() {
    TZ=$(timedatectl show -p Timezone --value)
    export TZ
}

ProfileBaseXdg() {
    XDG_CACHE_HOME=$HOME/.cache
    XDG_CONFIG_DIRS=/etc/xdg
    XDG_CONFIG_HOME=$HOME/.config
    XDG_DATA_DIRS=/usr/local/share:/usr/share
    XDG_DATA_HOME=$HOME/.local/share
    XDG_STATE_HOME=$HOME/.local/state
    export \
        XDG_CACHE_HOME \
        XDG_CONFIG_DIRS \
        XDG_CONFIG_HOME \
        XDG_DATA_DIRS \
        XDG_DATA_HOME \
        XDG_STATE_DIR
}

ProfileBaseXdgExt() {
    XDG_BIN_HOME=$HOME/.local/bin
    XDG_LOCAL_DIR=$HOME/.local
    export \
        XDG_BIN_HOME \
        XDG_LOCAL_DIR
}

ProfileBasePath() {
    PATH=$XDG_BIN_HOME:$PATH
    export PATH
}
