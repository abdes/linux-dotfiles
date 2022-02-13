# Linux dotfiles

This is my collection of dotfiles for Linux systems, all stored in a bare git repo, and managed with the technique described at: https://www.atlassian.com/git/tutorials/dotfiles.

To install on a freshly minted machine or container:

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

TODO: Install additional vim plugins

## Linux packages

TODO: Packages that need to be installed...
