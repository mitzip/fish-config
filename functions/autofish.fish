# auto updating for whatever branch your on
function autofish -d 'Auto update fish config and functions'
    set origPWD $PWD
    cd ~/.config/fish
    if not test (git rev-parse HEAD) = (git ls-remote --heads (git ls-remote --get-url) (git rev-parse --abbrev-ref '@{u}' | sed 's/origin\///g') | cut -f1)
        eval git pull --rebase --stat (git rev-parse --abbrev-ref '@{u}' | sed 's/\// /g')
    end
    cd $origPWD
end

