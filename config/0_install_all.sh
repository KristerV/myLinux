yaourt -Syu
sudo mhwd-kernel -i linux313
reboot
yaourt -Syu
yaourt -S --noconfirm git
yaourt -S --noconfirm chromium
yaourt -S --noconfirm dropbox
yaourt -S --noconfirm sublime-text-dev
yaourt -S --noconfirm openssh
yaourt -S --noconfirm vim
yaourt -S --noconfirm make
yaourt -S --noconfirm inkskape
yaourt -S --noconfirm nodejs
yaourt -S --noconfirm skype
yaourt -S --noconfirm gnome-terminal
yaourt -S --noconfirm chromium-pepper-flash
curl https://install.meteor.com/ | sh

## ID Kaart - https://wiki.archlinux.org/index.php/Estonian_ID-card
yaourt -S --noconfirm pcsclite esteidcerts esteidfirefoxplugin esteidpkcs11loader qesteidutil qdigidoc
systemctl enable pcscd.socket

## Conky
yaourt -S --noconfirm conky-lua
rm /home/krister/.conkyrc
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/conkyrc /home/krister/.conkyrc
sudo cp /home/krister/Dropbox/Linux/ManjaroXfce_config/Antipasto.otf /usr/share/fonts/

## Aliases
echo 'alias k="/home/krister/Dropbox/Linux/cmd/kuti"' >> ~/.bashrc
# echo 'alias cdo="cd /srv/ois/;clear;pwd;git status"' >> ~/.bashrc
# echo 'alias cdm="cd /home/krister/code/movieatmyplace;clear;pwd;git status"' >> ~/.bashrc

## Xfce settings
rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/xfce4-keyboard-shortcuts.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
rm /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/xfce4-panel.xml /home/krister/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

## Oblogout
yaourt -S --noconfirm oblogout
sudo rm /etc/oblogout.conf
sudo ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/oblogout.conf /etc/oblogout.conf

## LXDM
sudo pacman -S lxdm
sudo systemctl enable lxdm.service -f

## Devilspie2
yaourt -S --noconfirm devilspie2
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/gridOf9.lua /home/krister/.config/devilspie2/gridOf9.lua
## Add to autostart from session manager

## Sublime text
yaourt -S --noconfirm sublime-text-dev
rm /home/krister/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
rm /home/krister/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/Default\ \(Linux\).sublime-keymap /home/krister/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/Preferences.sublime-settings /home/krister/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/semicolon.sublime-macro /home/krister/.config/sublime-text-3/Packages/User/semicolon.sublime-macro
ln -s /home/krister/Dropbox/Linux/ManjaroXfce_config/unfoldfunction.sublime-macro /home/krister/.config/sublime-text-3/Packages/User/unfoldfunction.sublime-macro
# https://sublime.wbond.net/installation
# Monokai Extended

## EXTRA
# Chromium needs to disable hardware acceleration

# sudo vim /etc/pam.d/mdm
# auth            optional        pam_gnome_keyring.so
# session         optional        pam_gnome_keyring.so auto_start