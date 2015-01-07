function upworld -d 'Fully update a box using the Portage package manager'
    if mount | grep -v rw > /dev/null ^ /dev/null
        if mount | grep -v rw | grep portage > /dev/null ^ /dev/null
            if which eix-update > /dev/null ^ /dev/null
                sudo eix-update
            end
        else
            if which eix-sync > /dev/null ^ /dev/null
                sudo eix-sync
            else
                sudo emerge --sync
            end
        end
    end

    if which emerge > /dev/null ^ /dev/null
        sudo emerge -uDvaN --with-bdeps=y --complete-graph=y --keep-going=y --backtrack=100 @world; and \
        sudo revdep-rebuild; and \
        sudo emerge --depclean
    else
        echo 'Error: emerge not found'
    end
end
