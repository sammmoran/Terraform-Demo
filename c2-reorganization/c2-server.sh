#! /bin/bash
git clone --recurse-submodules https://github.com/cobbr/Covenant -y
wget https://download.visualstudio.microsoft.com/download/pr/e137cdac-0e15-46ec-bd60-14fe6ad50c41/30c102677cc4bd0f117cc026781ec5e8/dotnet-sdk-3.1.423-linux-x64.tar.gz -y
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.423-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet 
export PATH=$PATH:$HOME/dotnet

cd Covenent/Covenent/
dotnet run