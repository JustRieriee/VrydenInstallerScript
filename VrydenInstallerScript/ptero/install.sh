if warp h foo >/dev/null 2>&1; then
    echo "##############################"
    echo ""
    echo "Warp Detected, Proceeding In 10 Seconds"
    echo ""
    echo "For Help Contact justrieriee Or Open Ticket"
    echo ""
    echo "##############################"
    sleep 10
    apt update -y && apt install curl -y
    bash <(curl -s https://pterodactyl-installer.se)



else
    echo "##############################"
    echo ""
    echo "Install Warp First"
    echo ""
    echo "For Help Contact justrieriee"
    echo ""
    echo "##############################"
    
    fi
