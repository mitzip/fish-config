if which byobu-launcher > /dev/null ^ /dev/null
    status --is-login; and status --is-interactive; and exec byobu-launcher
end

if test -d ~/.local/bin
    if not echo $fish_user_paths | grep "$HOME/\.local/bin" > /dev/null ^ /dev/null
        # If you've got it, use it!
        set --universal fish_user_paths $fish_user_paths ~/.local/bin
    end
end

if test -e ~/.config/fish/functions/autoupdate.fish
    autoupdate
end
