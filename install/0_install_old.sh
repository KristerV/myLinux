
echo "--------------------- keybindings (terminal) ---------------------------"
# clear and reset pane <Primary>k
# $HOME/.config/xfce4/terminal/accels.scm



echo " --------------------- remove PC speaker beep --------------------- "
# sudo rmmod pcspkr
# requires sudo -i
# sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

## EXTRA
# Chromium needs to disable hardware acceleration

# sudo vim /etc/pam.d/mdm
# auth            optional        pam_gnome_keyring.so
# session         optional        pam_gnome_keyring.so auto_start
