This is what I use to configure my Antergos (Arch) Linux. Check it out [in action](http://code.krister.ee/my-coding-environment/).

## How to use

_Note: This repo is of no use to you unless you're installing Antergos and want my exact setup._

1. Install your ssh keys with `chmod 600 ~/.ssh/*`
1. `./install/0_install.sh` to install everything possible
1. `./install/0_install_overnight.sh` has some extra apps that take a while to compile
1. `./bash` should automatically be configured by the automated install
1. Now go down and do "Manual configuration".

## Dual boot

To dual boot with windows I had windows already installed and made the partitions manually, creating a separate /boot for grub which detected Windows automatically, but I still had to [fix it's boot](https://askubuntu.com/a/729752/811632).

## Useful commands

To set timezone: `timedatectl set-timezone Europe/Tallinn`

## Manual configuration

Some keyboard commands have to be entered manually

```
amixer -q set Master mute
amixer -q set Master 5%+ unmute
amixer -q set Master 5%- unmute
amixer -q set Capture toggle
pavucontrol

xfce4-appfinder
xfce4-screenshooter
xfce4-session-logout
xfce-terminal --fullscreen

subl3
thunar
chromium

/home/krister/code/myLinux/bash/functions.sh toggleConky
/home/krister/code/myLinux/bash/functions.sh startGromit
/home/krister/code/myLinux/bash/kuti_screencast.sh killrec
/home/krister/code/myLinux/bash/kuti_screencast.sh rec720pulse
```