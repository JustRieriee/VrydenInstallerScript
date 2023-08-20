if [ "$(id -u)" != "0" ]; then
   echo "Please Run This Script As A root User" 1>&2
   exit 1
fi

apt install sudo -y


echo "#######################################################################################"
echo "#"
echo "#                                  VPSFREE.ES SCRIPTS"
echo "#"
echo "#"
echo "#                          Copyright (C) 2022 - 2023, VPSFREE.ES"
echo "#"
echo "#######################################################################################"
echo ""
echo "* [1] Install Minecraft Server Files"
echo "* [2] Install Warp to enable Ipv4 on Ipv6 only"
echo "* [3] Download Playit files to make tunnels to V4 & V6"
echo "* [4] Install PufferPanel"
echo "* [5] Install WebPage"
echo "* [6] Install CRDP/XRDP"
echo "* [7] Install Basic Packages"
echo "* [8] Install Pterodactyl Panel"
echo "* [9] Exit"

read -p "Enter Input - ( 0-7 ): " input

case $input in

    1)
    apt update
    wget -N https://raw.githubusercontent.com/JustRieriee/VrydenInstallerScript/main/VrydenInstallerScript/minecraftscript/install.sh && bash install.sh;;
    2)
    apt update
    apt install curl -y
    wget -N https://raw.githubusercontent.com/JustRieriee/VrydenInstallerScript/main/VrydenInstallerScript/warpv6/install.sh && bash install.sh;;
    3)
    apt update
    apt install wget -y
    mkdir playit && cd playit
    wget https://github.com/JustRieriee/VrydenInstallerScript/tree/main/playit-0.9.3
    mv playit-0.9.3 playit
    chmod 755 playit
    echo "Playit Installation Complete! Proceeding In 3S"
    sleep 3
    ./playit;;
    4)
    apt update && apt install curl -y
    curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
    sudo apt-get install pufferpanel
    sudo systemctl enable pufferpanel
    sudo pufferpanel user add
    sudo systemctl enable --now pufferpanel;;
    5)
    wget -N https://raw.githubusercontent.com/JustRieriee/VrydenInstallerScript/main/VrydenInstallerScript/websitescript/install.sh && bash install.sh;;
    6)
    wget -N https://raw.githubusercontent.com/dxomg/vpsfreescripts/main/vpsfreescripts/crdpscript/install.sh && bash install.sh;;
    7)
    apt install git neofetch sudo
    echo "##############################"
    echo ""
    echo "Installed git and neofetch"
    echo ""
    echo "##############################";;
    8)
    wget -N https://raw.githubusercontent.com/JustRieriee/VrydenInstallerScript/main/VrydenInstallerScript/ptero/install.sh && bash install.sh;;
    9) echo "Exit" && exit;;
esac
