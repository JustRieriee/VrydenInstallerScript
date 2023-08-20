echo "Installing Dependencies..."
sleep 1
apt update
apt install curl -y
curl -s https://deb.nodesource.com/setup_16.x | sudo bash
apt install nodejs -y
npm install pm2 -g
pm2 startup
wget -O playit https://raw.githubusercontent.com/dxomg/plygg/main/playit-0.9.3
chmod 755 playit
echo "Available Minecraft Versions:"
echo "1 > 1.18.2 ( Recommended 4GiB+ Ram)"
echo "2 > 1.16.5 ( Recommended 4GiB+ Ram)"
echo "3 > 1.12.2"
echo "4 > 1.8.8"
echo ""
read -p "Enter Minecraft Version: " minecraftv

case $minecraftv in
    1)
        echo "Selected: ${minecraftv} > 1.18.2"
        mkdir -p mcserver/cache/ && wget -O mcserver/cache/mojang_1.18.2.jar "https://drive.google.com/uc?id=1WJ0etteMz3il7gs5iJhDyjoF1t4L35UN&export=download&confirm=t&uuid=f82a51cd-60da-4672-9ec8-445e88cff74c"
        sleep 1
        cd mcserver
        wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar
        echo "eula=true" > eula.txt
        apt install openjdk-17-jre-headless -y
        pm2 start "java -jar server.jar"
        echo "Server Is Up And Running!"
        echo "To Check The Logs Do:"
        echo "pm2 logs 1"
        echo ""
        echo "To Attach To The Console Do:"
        echo "pm2 attach 1"
        echo ""
        echo "For More Commands Please Check The Help For Pm2"
        ;;

    2)
        echo "Selected: ${minecraftv} > 1.16.5"
        mkdir -p mcserver/cache/ && wget -O mcserver/cache/mojang_1.16.5.jar "https://drive.google.com/uc?id=14a-_cH_UTbJDnk3CrpDuN5fZEcEyWq1M&export=download&confirm=t&uuid=7b6920de-983c-443c-ae9c-54c5cb49d4eb"
        sleep 1
        cd mcserver
        wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar
        echo "eula=true" > eula.txt
        apt install openjdk-16-jre-headless -y
        pm2 start "java -jar server.jar"
        echo "Server Is Up And Running!"
        echo "To Check The Logs Do:"
        echo "pm2 logs 1"
        echo ""
        echo "To Attach To The Console Do:"
        echo "pm2 attach 1"
        echo ""
        echo "For More Commands Please Check The Help For Pm2"
        ;;

    3)
        echo "Selected: ${minecraftv} > 1.12.2"
        mkdir -p mcserver/cache/ && wget -O mcserver/cache/mojang_1.12.2.jar "https://drive.google.com/uc?id=15qfDkTE2SHyURkgsZnABDPpIMEjPGWuk&export=download&confirm=t&uuid=2e6b5563-74c5-4403-893c-c9172e20e530"
        sleep 1
        cd mcserver
        wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
        echo "eula=true" > eula.txt
        apt install openjdk-8-jdk-headless -y
        pm2 start "java -jar server.jar"
        echo "Server Is Up And Running!"
        echo "To Check The Logs Do:"
        echo "pm2 logs 1"
        echo ""
        echo "To Attach To The Console Do:"
        echo "pm2 attach 1"
        echo ""
        echo "For More Commands Please Check The Help For Pm2"
        ;;

    4)
        echo "Selected: ${minecraftv} > 1.8.8"
        mkdir -p mcserver/cache/ &&  wget -O mcserver/cache/mojang_1.8.8.jar "https://drive.google.com/uc?id=1FEezlJMtzSAfaXWt3WmNzoc2MnrN-qAm&export=download"
        sleep 1
        cd mcserver
        wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
        echo "eula=true" > eula.txt
        apt install openjdk-8-jdk-headless -y
        pm2 start "java -jar server.jar"
        echo "Server Is Up And Running!"
        echo "To Check The Logs Do:"
        echo "pm2 logs 1"
        echo ""
        echo "To Attach To The Console Do:"
        echo "pm2 attach 1"
        echo ""
        echo "For More Commands Please Check The Help For Pm2"
        ;;
esac
cd ..
echo "__________________________________________________________"
echo ""
echo ""
echo "Please Make An Account At https://playit.gg"
echo "Playit Will Ask You To Log In In 5 Seconds, Please Follow What It Says"
echo "When You're Done Press Ctrl + C And It Should Be Done"
echo ""
echo "__________________________________________________________"
sleep 5
pm2 start "./playit -s"
pm2 save
pm2 logs 1
