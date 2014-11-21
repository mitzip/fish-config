if which byobu-launcher
    status --is-login; and status --is-interactive; and exec byobu-launcher
end

if test -d ~/.local/bin
    # If you've got it, use it!
    set --universal fish_user_paths $fish_user_paths ~/.local/bin
end
