if which byobu-launcher
    status --is-login; and status --is-interactive; and exec byobu-launcher
end

if test -d ~/.local/bin
    # If you've got it, use it!
    set --universal fish_user_paths $fish_user_paths ~/.local/bin
end

cd ~/.config/fish
if not test (git rev-parse HEAD) = (git ls-remote (git rev-parse --abbrev-ref '@{u}' | sed 's/\// /g') | cut -f1)
    git pull --rebase --stat origin master
end
cd ~/
