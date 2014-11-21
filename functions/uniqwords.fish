function uniqwords -d 'Get a list of unique words from STDIN'
    cat - | tr '[:upper:]' '[:lower:]' | tr '\n' ' ' | tr -cd '[:alpha:] \'' | tr ' ' '\n' | sort -u
end
