# Linux dotfiles

This is my collection of dotfiles for Linux systems, all stored in a bare git
repo, and managed with the technique described at:
https://www.atlassian.com/git/tutorials/dotfiles.

To install on a freshly minted machine or container:


## Setup Arch

### Linux packages

TODO: Packages that need to be installed...

### Xorg High DPI

1- Manually configure the monitor in the X11 config.
   https://wiki.archlinux.org/title/org#Monitor_settings

```
Section "Monitor"
  Identifier "Virtual1"
  Modeline "3840x2160_60.00" 712.34 3840 4152 4576 5312 2160 2161 2164 2235 -HSync +V
  Option "PreferredMode" "3840x2160_60.00"
  DisplaySize 597 336 # In millimeters
EndSection
```

Modeline can be obtained by using an online calculator (Google). Exact display
dimensions can be obtained either from the manufacturer specs or by calculating
it based on the diagonal size.

2- Get the real DPI from `xdpyinfo grep -B2 resolution

```
   screen #0:
    dimensions:    3840x2160 pixels (598x336 millimeters)
    resolution:    163x163 dots per inch
```

3- Set the dpi in the X server command line at the display manager, e.g. for
  `sddm`, we add the '-dpi 163' to 'ServerArguments' in /etc/sddm/sddm.conf


### Manual install additional packages

#### SDDM sugar-candy theme

https://framagit.org/MarianArlt/sddm-sugar-candy

sudo mkdir -p /usr/share/sddm/themes/sugar-candy && \
  curl -s https://framagit.org/MarianArlt/sddm-sugar-candy/-/archive/v.1.1/sddm-sugar-candy-v.1.1.tar.gz | \
	sudo tar zxvf - -C /usr/share/sddm/themes/sugar-candy --strip-components 1.1

#### Rust

rustup default stable

#### Java

sudo archlinux-java set java-17-openjdk

#### Ruby

gem install neovim



## Setup dotfiles

```shell
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

To edit dotfiles in `vscode` and have full access to git functionality, use the
alias defined below:

```shell
alias dote=GIT_WORK_TREE=~ GIT_DIR=.dotfiles code ~
```

## Finalize Git settings

```
GIT_AUTHOR_NAME="<Your Name>"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="<Your Masked Address>"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## Finalize zsh setup

TODO: Install oh-my-zsh and plugins

## Finalize vim setup

:TSInstall <tab>

:LSPInstall <tab>

