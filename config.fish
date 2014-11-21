if which byobu-launcher > /dev/null ^ /dev/null
    status --is-login; and status --is-interactive; and exec byobu-launcher
end

if test -d ~/.local/bin
    if not echo $fish_user_paths | grep "$HOME/\.local/bin" > /dev/null ^ /dev/null
        # If you've got it, use it!
        set --universal fish_user_paths $fish_user_paths ~/.local/bin
    end
end

# auto updating for whatever branch your on
begin
    set -l origPWD $PWD
    cd ~/.config/fish
    if not test (git rev-parse HEAD) = (git ls-remote --heads (git ls-remote --get-url) (git rev-parse --abbrev-ref '@{u}' | sed 's/origin\///g') | cut -f1)
        git pull --rebase --stat (git rev-parse --abbrev-ref '@{u}' | sed 's/\// /g')
    end
    cd $origPWD
end
