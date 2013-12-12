if [ -d ~/.tmux-powerline ]
then
  echo "\033[0;33mYou already have tmux configured.\033[0m You'll need to remove ~/.tmux-powerline if you want to install/reinstall"
  exit
fi

echo "\033[0;34mCloning tmux-powerline...\033[0m"
hash git >/dev/null && /usr/bin/env git clone git@github.com:jhezjkp/tmux-powerline.git ~/.tmux-powerline || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing tmux config...\033[0m"
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]
then
  echo "\033[0;33mFound ~/.tmux.conf.\033[0m \033[0;32]Backing up to ~/.tmux.conf.pre\033[0m";
  cp ~/.tmux.conf ~/.tmux.conf.pre;
  rm ~/.tmux.conf;
fi

echo "\033[0;34mlink ~/.tmux.conf to ~/.tmux-powerline/tmux.conf\033[0m"
ln -s ~/.tmux-powerline/tmux.conf ~/.tmux.conf

echo "\nYour tmux is now configured!\n\033[0m"
