function mutt -d 'Mutt mail client'
    if which mutt > /dev/null ^ /dev/null
        bash --login -c 'cd ~/Downloads; mutt' $argv;
    else
        echo 'Error: mutt not found'
    end
end
