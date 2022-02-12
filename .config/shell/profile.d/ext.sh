#!/bin/sh

ProfileExtGlib() {
    command -- /usr/bin/gsettings set org.gtk.Settings.FileChooser startup-mode cwd
    command -- /usr/bin/gsettings set org.gnome.desktop.interface gtk-key-theme Emacs

    if test "$X_DPI" -gt 96; then
        command -- /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 2
    else
        command -- /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 1
    fi
}

ProfileExtGtk() {
    : "$((GDK_SCALE = X_DPI > 96 ? 2 : 1))"
    GDK_DPI_SCALE=0.5 # undo scaling for fonts
    export GDK_SCALE
    export GDK_DPI_SCALE
}

ProfileExtJava() {
    _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
    export _JAVA_OPTIONS
}

ProfileExtLess() {
    LESSCHARSET=UTF-8
    # LESSCOLORIZER=$XDG_BIN_HOME/highlighter;
    LESS=-R\ -cfMS\ --shift\ 5
    LESSCOLOR=1
    LESSHISTFILE=/dev/null

    export \
        LESSCHARSET \
        LESS \
        LESSCOLOR \
        LESSHISTFILE
}

ProfileExtMan() {
    MANPATH=${XDG_DATA_HOME:?}/man:/usr/local/share/man:/usr/share/man
    MANWIDTH=80

    export \
        MANPATH \
        MANWIDTH
}

ProfileExtQt() {
    #: "$((QT_AUTO_SCREEN_SCALE_FACTOR = X_DPI > 96 ? 2 : 1))"
    QT_AUTO_SCREEN_SCALE_FACTOR=1
    QT_ACCESSIBILITY=1
    QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
    QT_STYLE_OVERRIDE=Breeze

    export \
        QT_ACCESSIBILITY \
        QT_AUTO_SCREEN_SCALE_FACTOR \
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
        QT_STYLE_OVERRIDE
}

ProfileExtDbus() {
    command -- /usr/bin/dbus-update-activation-environment --systemd \
        DISPLAY \
        GDK_SCALE \
        PATH \
        QT_ACCESSIBILITY \
        QT_AUTO_SCREEN_SCALE_FACTOR \
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
        XAUTHORITY \
        X_DPI \
        X_XCLIENT
}
