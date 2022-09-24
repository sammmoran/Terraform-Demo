#! /bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install ubuntu-desktop
sudo apt install tightvncserver
sudo apt install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

vncserver :1
echo "#!/bin/sh" >> ~/.vnc/xstartup
echo "export XKL_XMODMAP_DISABLE=1" >> ~/.vnc/xstartup
echo "unset SESSION_MANAGER" >> ~/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> ~/.vnc/xstartup
echo "[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup" >> ~/.vnc/xstartup
echo "[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources" >> ~/.vnc/xstartup
echo "xsetroot -solid grey" >> ~/.vnc/xstartup
echo "vncconfig -iconic &" >> ~/.vnc/xstartup
echo "gnome-panel &" >> ~/.vnc/xstartup
echo "gnome-settings-daemon &" >> ~/.vnc/xstartup
echo "metacity &" >> ~/.vnc/xstartup
echo "nautilus &" >> ~/.vnc/xstartup
echo "gnome-terminal &" >> ~/.vnc/xstartup

vncserver -kill :1
vncserver :1


git clone --recurse-submodules https://github.com/cobbr/Covenant -y
wget https://download.visualstudio.microsoft.com/download/pr/e137cdac-0e15-46ec-bd60-14fe6ad50c41/30c102677cc4bd0f117cc026781ec5e8/dotnet-sdk-3.1.423-linux-x64.tar.gz -y
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.423-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet 
export PATH=$PATH:$HOME/dotnet

cd Covenent/Covenent/
dotnet run