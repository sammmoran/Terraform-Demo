#! /bin/bash

sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install ubuntu-desktop -y
sudo apt install tightvncserver -y
sudo apt install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y
 

# Try out the following
echo $VNC_PASSWD | vncpasswd -f > ~/.vnc/passwd
chown -R ubuntu ~/.vnc
chmod 0600 /home/$myuser/.vnc/passwd

vncserver :1

echo '#!/bin/sh' > ~/.vnc/xstartup

echo 'export XKL_XMODMAP_DISABLE=1' >> ~/.vnc/xstartup
echo 'unset SESSION_MANAGER' >> ~/.vnc/xstartup
echo 'unset DBUS_SESSION_BUS_ADDRESS' >> ~/.vnc/xstartup

echo '[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup' >> ~/.vnc/xstartup
echo '[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources' >> ~/.vnc/xstartup
echo 'xsetroot -solid grey' >> ~/.vnc/xstartup

echo 'vncconfig -iconic &' >> ~/.vnc/xstartup
echo 'gnome-panel &' >> ~/.vnc/xstartup
echo 'gnome-settings-daemon &' >> ~/.vnc/xstartup
echo 'metacity &' >> ~/.vnc/xstartup
echo 'nautilus &' >> ~/.vnc/xstartup
echo 'gnome-terminal &' >> ~/.vnc/xstartup

vncserver -kill :1

vncserver :1

git clone --recurse-submodules https://github.com/cobbr/Covenant

#wget https://download.visualstudio.microsoft.com/download/pr/e137cdac-0e15-46ec-bd60-14fe6ad50c41/30c102677cc4bd0f117cc026781ec5e8/dotnet-sdk-3.1.423-linux-x64.tar.gz -y

sudo snap install dotnet-sdk --classic --channel=6.0
sudo snap alias dotnet-sdk.dotnet dotnet
sudo snap install dotnet-runtime-60 --classic
sudo snap alias dotnet-runtime-60.dotnet dotnet
export DOTNET_ROOT=/snap/dotnet-sdk/current
sudo dotnet --info

mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.423-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet 
export PATH=$PATH:$HOME/dotnet

#cd Covenent/Covenent/
#dotnet run