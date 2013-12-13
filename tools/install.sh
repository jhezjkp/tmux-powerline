#!/usr/bin/env bash

if [ -d ~/.tmux-powerline ]
then
    echo "You already have tmux configured. You'll need to remove ~/.tmux-powerline if you want to install/reinstall"
    exit
fi

echo "Cloning tmux-powerline..."
hash git >/dev/null && /usr/bin/env git clone git@github.com:jhezjkp/tmux-powerline.git ~/.tmux-powerline || {
    echo "git not installed"
    exit
}

echo "Looking for an existing tmux config..."
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]
then
    echo "Found ~/.tmux.conf. Backing up to ~/.tmux.conf.pre";
    cp ~/.tmux.conf ~/.tmux.conf.pre;
    rm ~/.tmux.conf;
fi

echo "link ~/.tmux.conf to ~/.tmux-powerline/tmux.conf"
ln -s ~/.tmux-powerline/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

echo "Your tmux is now configured!"
