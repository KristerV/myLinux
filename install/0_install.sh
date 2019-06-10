#!/bin/bash
# This file will not run automatically. Better run each paragraph separately.
# You may need the `dos2unix` command to change newlines.

echo " ===> Install all useful packages"
sudo pacman -Sy yay
yay -Sy \
    vim zsh ffcast file-roller thefuck \
    sublime-text-dev visual-studio-code-bin \
    gimp inkscape \
    brave-bin firefox \
    docker docker-compose docker-machine nodejs \
    redshift albert muparser baobab blueman \
    keybase-bin hugo \
    vlc popcorntime-bin \
    conky-lua-archers \
    wmctrl zsh oh-my-zsh-git \
    gromit-mpx-git xf86-input-wacom \
    qdigidoc4 ccid \
    htop

echo " ===> ID KAART"
sudo systemctl enable pcscd
sudo systemctl start pcscd

echo " ===> yay colors"
# Make sure you have the Color option in your /etc/pacman.conf (see issue https://github.com/Jguer/yay/issues/123).

echo " ===> terminal reset and clear"
sudo sed -i 's/^;.*reset-and-clear" "")/\(gtk_accel_path "<Actions>\/terminal-window\/reset-and-clear" "<Primary>k"\)/' ~/.config/xfce4/terminal/accels.scm

echo " ===> ZSH"
# This command may crash bash so need to restart after
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Custom config
rm ~/.zshrc
ln -s ~/code/myLinux/install/zshrc ~/.zshrc

## VIM
yay -S vim-surround vim-gitgutter vim-airline vim-repeat vim-supertab vim-auto-pairs vim-molokai
ln -s ~/code/myLinux/install/vimrc ~/.vimrc

#######################################################
##              Didn't use last time                 ##

echo " ===> Conky"
rm /home/krister/.conkyrc
ln -s code/myLinux/install/conkyrc ~/.conkyrc
sudo cp ~/code/myLinux/install/Antipasto.otf /usr/share/fonts/

echo " ===> Gromit conf"
sudo ln -s -f ~/code/myLinux/install/gromit-mpx.cfg /usr/etc/gromit-mpx/gromit-mpx.cfg

echo " ===> Be free from screen tearing"
echo "export XFWM4_USE_PRESENT=1" >> ~/.profile

# This you may or may not want
cat >> ~/.oh-my-zsh/themes/robbyrussell.zsh-theme <<"EOL"
PROMPT='%{$fg_bold[green]%}$USER%{$reset_color%} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
EOL