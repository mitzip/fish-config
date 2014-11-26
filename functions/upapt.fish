function upapt -d 'Fully update an box using APT package manager'
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade
    sudo apt-get -y autoremove
    sudo apt-get -y autoclean
    sudo apt-get check
end

