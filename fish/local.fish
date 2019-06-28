function rwifi
    sudo nmcli radio wifi off
    sudo systemctl restart NetworkManager.service
    sudo nmcli radio wifi on
end
