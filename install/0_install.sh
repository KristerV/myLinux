#!/bin/bash
# This file is made to run all at once, but it's likely you'll get errors.
# You may need the `dos2unix` command to change newlines.

echo " ---------------------------- AUR config ---------------------------- "
ln -s ~/code/myLinux/install/yaourtrc ~/.yaourtrc

echo " ------------ Install all the amazing software from yaourt ------------- "
yes | yaourt -Syu --aur
yes | yaourt -S vim zsh ffcast file-roller thefuck
yes | yaourt -S sublime-text-dev visual-studio-code-bin
yes | yaourt -S gimp inkscape
yes | yaourt -S vivaldi firefox
yes | yaourt -S docker docker-compose docker-machine nodejs
yes | yaourt -S redshift albert baobab blueman
yes | yaourt -S keybase
yes | yaourt -S vlc popcorntime-bin

echo " ------------------------------- bashrc -------------------------------- "
echo "source ~/code/myLinux/bash/bashrc" >> ~/.bashrc
sudo sed -i 's/^;.*reset-and-clear" "")/\(gtk_accel_path "<Actions>\/terminal-window\/reset-and-clear" "<Primary>k"\)/' ~/.config/xfce4/terminal/accels.scm

echo " ------------------------------ VIM conf ------------------------------- "
curl http://j.mp/spf13-vim3 -L -o - | sh
ln -s ~/code/myLinux/install/vimrc.local ~/.vimrc.local

echo " -------------------------------- Conky -------------------------------- "
yes | yaourt -S conky-lua-archers
rm /home/krister/.conkyrc
ln -s code/myLinux/install/conkyrc ~/.conkyrc
sudo cp ./Antipasto.otf /usr/share/fonts/

echo " ------------------------------- ID Card ------------------------------- "
gpg --recv-keys 378B845402277962
yes | yaourt -S opensc-esteid ccid chrome-token-signing qdigidoc qesteidutil esteidfirefoxplugin
sudo systemctl enable pcscd.socket

echo " ------------------------- Set language to US -------------------------- "
sudo sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
sudo locale-gen
echo LANG=en_US.UTF-8 | sudo tee -a /etc/locale.conf

echo " ------------------------------- Gromit -------------------------------- "
yes | yaourt -S gromit-mpx-git xf86-input-wacom
sudo ln -s -f ~/code/myLinux/install/gromit-mpx.cfg /usr/etc/gromit-mpx/gromit-mpx.cfg

echo " --------------------------- ThinkPad stuff ---------------------------- "
# Trackpoint conf
echo SUBSYSTEM=="serio", DRIVERS=="psmouse", ACTION=="change", ENV{SERIO_TYPE}=="05", ATTR{press_to_select}="1", ATTR{sensitivity}="196", ATTR{speed}="255", ATTR{inertia}="4" | sudo tee /etc/udev/rules.d/10-trackpoint.rules
# Middle button scroll
sudo cp ~/code/myLinux/install/20-thinkpad.conf /etc/X11/xorg.conf.d/
# Disable middle click (the pasting is driving me crazy)
# If id is wrong xinput list | grep 'id='
xinput set-button-map 11 1 0 3

echo " --------------------------------- ZSH --------------------------------- "
rm ~/.zshrc
ln -s ~/code/myLinux/install/zshrc ~/.zshrc
cat >> ~/.oh-my-zsh/themes/robbyrussell.zsh-theme <<"EOL"
PROMPT='%{$fg_bold[green]%}$USER%{$reset_color%} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
EOL
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# Keep this last as it stops the script when because of switching shell

echo "\nNow reboot for all changes to take effect"

# Some commands use `tee` for writing into file. why: https://askubuntu.com/questions/103643/cannot-echo-hello-x-txt-even-with-sudo#103644