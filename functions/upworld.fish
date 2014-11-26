function upworld -d 'Fully update a box using the Portage package manager'
    if which emerge > /dev/null ^ /dev/null
        if which eix-update > /dev/null ^ /dev/null
            sudo eix-update
        end
        sudo emerge -uDvaN --with-bdeps=y --complete-graph=y --keep-going=y --backtrack=100 @world; and \
        sudo revdep-rebuild; and \
        sudo emerge --depclean
    else
        echo 'Error: emerge not found'
    end
end
