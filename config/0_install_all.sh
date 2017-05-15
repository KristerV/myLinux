#!/bin/bash
echo "if errors run dos2unix 0_install_all.sh"
yaourt -Syu
yaourt -S --noconfirm vim
yaourt -S --noconfirm zsh
yaourt -S --noconfirm ffcast
yaourt -S --noconfirm file-roller
yaourt -S --noconfirm sublime-text-dev
yaourt -S --noconfirm thefuck

echo " --------------------- keybindings (volume) --------------------- "

# https://wiki.archlinux.org/index.php/PulseAudio#Keyboard_volume_control
## map these to the keyboard
# sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%"
# sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%"
# pactl set-sink-mute 0 toggle

## Ei tööta
# ln -s ~/code/myLinux/config/xbindkeysrc ~/.xbindkeysrc
# ln -s ~/code/myLinux/config/xprofile ~/.xprofile

echo " --------------------- oh-my-ZSH --------------------- "
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm ~/.zshrc
ln -s ~/code/myLinux/config/zshrc ~/.zshrc

echo " --------------------- remove PC speaker beep --------------------- "
sudo rmmod pcspkr
echo "blacklist pcspkr" > sudo /etc/modprobe.d/nobeep.conf

echo " --------------------- Kuti Scriptid --------------------- "
echo "source ~/code/myLinux/cmd/kuti" >> ~/.bashrc

echo " --------------------- screen setup --------------------- "
yaourt -S --noconfirm screen
ln -s ~/code/myLinux/config/screenrc ~/.screenrc

echo " --------------------- yaourt conf --------------------- "
ln -s ~/code/myLinux/config/yaourtrc ~/.yaourtrc

echo " --------------------- install gromit --------------------- "
yaourt -S --noconfirm xf86-input-wacom
cd ~/code
git clone git@github.com:altercation/arch-packages.git
cd arch-packages/gromit-mpx-git/
# needs manual confirm
makepkg -sri
# exists already and needs sudo
rm /etc/gromit-mpx/gromit-mpx.cfg
ln -s ~/code/myLinux/config/gromit-mpx.cfg /etc/gromit-mpx/gromit-mpx.cfg

# echo " --------------------- Meteor --------------------- "
# Don't want this anymore
# curl https://install.meteor.com/ | sh

echo " --------------------- Vim Distribution --------------------- "
curl http://j.mp/spf13-vim3 -L -o - | sh
ln -s ~/code/myLinux/config/vimrc.local ~/.vimrc.local

echo " --------------------- Enable middle button scroll --------------------- "
cd ~/code/myLinux/config/
sudo cp ./20-thinkpad.conf /etc/X11/xorg.conf.d/

echo " --------------------- Set time syncing on --------------------- "
timedatectl set-ntp true

echo " --------------------- Conky --------------------- "
yaourt -S --noconfirm conky-lua-archers
rm /home/krister/.conkyrc
ln -s code/myLinux/config/conkyrc ~/.conkyrc
sudo cp ./Antipasto.otf /usr/share/fonts/

echo " --------------------- ID Kaart --------------------- "
# esteidcerts does not exist anymore :s
# yaourt -S --noconfirm pcsclite esteidcerts esteidfirefoxplugin esteidpkcs11loader qesteidutil qdigidoc
# systemctl enable pcscd.socket

echo " --------------------- Xfce settings --------------------- "
# These files don't exist anymore
# rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
# ln -s ~/code/myLinux/config/xfce4-keyboard-shortcuts.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
# rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# ln -s ./xfce4-panel.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# to restore defaults run
# xfce4-panel --quit ; pkill xfconfd ; rm -rf ~/.config/xfce4/panel ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml ; xfce4-panel;

# This command will stop the script
chsh -s /bin/zsh
echo "please reboot for changes to take effect - tegelt ka"

## EXTRA
# Chromium needs to disable hardware acceleration

# sudo vim /etc/pam.d/mdm
# auth            optional        pam_gnome_keyring.so
# session         optional        pam_gnome_keyring.so auto_start
