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
    qdigidoc4 \
    mailspring

echo " ===> yay colors"
# Make sure you have the Color option in your /etc/pacman.conf (see issue https://github.com/Jguer/yay/issues/123).

echo " ===> bashrc"
echo "source ~/code/myLinux/bash/bashrc" >> ~/.bashrc

echo " ===> terminal reset and clear"
sudo sed -i 's/^;.*reset-and-clear" "")/\(gtk_accel_path "<Actions>\/terminal-window\/reset-and-clear" "<Primary>k"\)/' ~/.config/xfce4/terminal/accels.scm

echo " ===> VIM conf"
curl http://j.mp/spf13-vim3 -L -o - | sh
ln -s ~/code/myLinux/install/vimrc.local ~/.vimrc.local # didn't link last time..

echo " ===> Conky"
rm /home/krister/.conkyrc
ln -s code/myLinux/install/conkyrc ~/.conkyrc
sudo cp ~/code/myLinux/install/Antipasto.otf /usr/share/fonts/

echo " ===> Set language to US"
# sudo sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
# sudo locale-gen
# echo LANG=en_US.UTF-8 | sudo tee -a /etc/locale.conf

echo " ===> Gromit conf"
sudo ln -s -f ~/code/myLinux/install/gromit-mpx.cfg /usr/etc/gromit-mpx/gromit-mpx.cfg

echo " ===> ThinkPad stuff"
# This stuff either doesn't work or is not needed anymore
# Trackpoint conf
# echo SUBSYSTEM=="serio", DRIVERS=="psmouse", ACTION=="change", ENV{SERIO_TYPE}=="05", ATTR{press_to_select}="1", ATTR{sensitivity}="196", ATTR{speed}="255", ATTR{inertia}="4" | sudo tee /etc/udev/rules.d/10-trackpoint.rules

# # Middle button scroll
# sudo cp ~/code/myLinux/install/20-thinkpad.conf /etc/X11/xorg.conf.d/

# # Disable middle click (the pasting is driving me crazy)
# # If id is wrong xinput list | grep 'id='
# xinput set-button-map 11 1 0 3

# # Reactivate trackpad scroll after suspend
# sudo mkdir -p /etc/pm/config.d/
# sudo touch /etc/pm/config.d/01reload_mouse
#echo SUSPEND_MODULES="${SUSPEND_MODULES:+$SUSPEND_MODULES }psmouse" | sudo tee /etc/pm/config.d/01reload_mouse

echo " ===> Be free from screen tearing"
echo "export XFWM4_USE_PRESENT=1" >> ~/.profile

echo " ===> ZSH"
# This command may crash bash so need to restart after
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Custom config
rm ~/.zshrc
ln -s ~/code/myLinux/install/zshrc ~/.zshrc

# This you may or may not want
cat >> ~/.oh-my-zsh/themes/robbyrussell.zsh-theme <<"EOL"
PROMPT='%{$fg_bold[green]%}$USER%{$reset_color%} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
EOL

# Some commands use `tee` for writing into file. why: https://askubuntu.com/questions/103643/cannot-echo-hello-x-txt-even-with-sudo#103644

echo " ===> Other manual stuff"
# Keyboard hotkeys


#

export XFWM4_USE_PRESENT=1