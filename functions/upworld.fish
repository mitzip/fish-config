function upworld -d 'Fully update Funtoo system'
    sudo eix-update; and \
    sudo emerge -uDvaN --with-bdeps=y --complete-graph=y --keep-going=y --backtrack=100 @world; and \
    sudo revdep-rebuild; and \
    sudo emerge --depclean
end
