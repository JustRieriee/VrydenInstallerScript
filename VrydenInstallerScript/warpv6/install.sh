if warp h foo >/dev/null 2>&1; then
    echo "Endpoint = [2001:67c:2b0:db32:0:1:a29f:c001]:2408" >> /etc/wireguard/wgcf.conf
    echo "Patch Was Successfully Ppplied"
    echo "Now Run 'warp o' Again To Activate Warp"
else
    echo "======================================================"
    echo ""
    echo "When Script Starts Connecting To Warp Please Do Ctrl+C"
    echo "Then Do 'warp o'"
    echo "And Then Run This Script Again"
    echo "Script Will Proceed In 10 Seconds"
    echo ""
    echo "======================================================"
    sleep 10
    wget -N https://raw.githubusercontent.com/fscarmen/warp/main/menu.sh && bash menu.sh
fi
