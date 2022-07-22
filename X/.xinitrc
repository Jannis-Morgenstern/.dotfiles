#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

dbus-update-activation-environment --systemd DISPLAY
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK
export _JAVA_AWT_WM_NONREPARENTING=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export NEOVIDE_MULTIGRID=true

# Brainix
export DbPassword=BrainixDb2020
export MongoDbPassword=BrainixMongoDb2020
export RabbitMQ_Password=BrainixRabitMQ2020
export TaskServicePath="$HOME/development/titanom/brainix/Task Service"
export TrainingCenterServicePath="$HOME/development/titanom/brainix/training-center-service-v2"
export nvm_default_version="16.15.1"

pipewire &
pipewire-pulse &
wireplumber &
xset r rate 150 50
xsetroot -cursor_name left_ptr &
systemctl --user import-environment DISPLAY
clipmenud &
picom -f &
numlockx on &
# ~/.screenlayout/home_0.sh &&
~/.screenlayout/office_2.sh;
  feh --bg-scale ~/Wallpapers/cyberpunk-girl_4k_accent.jpg &
blueman-applet &
exec bspwm
