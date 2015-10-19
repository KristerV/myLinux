#!/bin/bash
echo "if errors run dos2unix 0_install_all.sh"
yaourt -Syu
yaourt -S --noconfirm chromium
yaourt -S --noconfirm atom-editor-bin
yaourt -S --noconfirm vim
yaourt -S --noconfirm inkskape
yaourt -S --noconfirm skype
yaourt -S --noconfirm chromium-pepper-flash
yaourt -S --noconfirm zsh
yaourt -S --noconfirm ffcast
yaourt -S --noconfirm file-roller

echo " --------------------- keybindings (volume) --------------------- "
ln -s ~/code/myLinux/config/xbindkeysrc ~/.xbindkeysrc
ln -s ~/code/myLinux/config/xprofile ~/.xprofile

echo " --------------------- oh-my-ZSH --------------------- "
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
rm ~/.zshrc
ln -s ~/code/myLinux/config/zshrc ~/.zshrc

echo " --------------------- remove PC speaker beep --------------------- "
sudo rmmod pcspkr
echo "blacklist pcspkr" > sudo /etc/modprobe.d/nobeep.conf

# echo " --------------------- keep time up to date --------------------- "
# timedatectl set-ntp true

echo " --------------------- Kuti Scriptid --------------------- "
echo "source ~/code/myLinux/cmd/kuti" >> ~/.bashrc

echo " --------------------- yaourt conf --------------------- "
ln -s ~/code/myLinux/config/yaourtrc ~/.yaourtrc

echo " --------------------- install gromit --------------------- "
yaourt -S --noconfirm xf86-input-wacom
cd ~/code
git clone git@github.com:altercation/arch-packages.git
cd arch-packages/gromit-mpx-git/
makepkg -sri
ln -s ~/code/myLinux/config/gromit-mpx.cfg /etc/gromit-mpx/gromit-mpx.cfg

echo " --------------------- Meteor --------------------- "
curl https://install.meteor.com/ | sh

echo " --------------------- Enable middle button scroll --------------------- "
sudo cp ./20-thinkpad.conf /etc/X11/xorg.conf.d/

echo " --------------------- Conky --------------------- "
yaourt -S --noconfirm conky-lua
rm /home/krister/.conkyrc
ln -s code/myLinux/config/conkyrc ~/.conkyrc
sudo cp ./Antipasto.otf /usr/share/fonts/

echo " --------------------- ID Kaart --------------------- "
# yaourt -S --noconfirm pcsclite esteidcerts esteidfirefoxplugin esteidpkcs11loader qesteidutil qdigidoc
# systemctl enable pcscd.socket

echo " --------------------- Xfce settings --------------------- "
# rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
# ln -s ~/code/myLinux//xfce4-keyboard-shortcuts.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
# rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# ln -s ./xfce4-panel.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# to restore defaults run
# xfce4-panel --quit ; pkill xfconfd ; rm -rf ~/.config/xfce4/panel ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml ; xfce4-panel;

echo "please reboot for changes to take effect - tegelt ka"

## EXTRA
# Chromium needs to disable hardware acceleration

# sudo vim /etc/pam.d/mdm
# auth            optional        pam_gnome_keyring.so
# session         optional        pam_gnome_keyring.so auto_start
