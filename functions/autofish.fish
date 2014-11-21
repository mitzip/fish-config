# auto updating for whatever branch your on
function autofish -d 'Auto update fish config and functions'
    if which git > /dev/null ^ /dev/null
        set origPWD $PWD
        cd ~/.config/fish
        set gitver (git --version | sed -e 's/^git version //' -e 's/\.//g')
        if test (math ".$gitver < .171122") -eq 1
            set gitRemoteURLcmd "git config --get remote.origin.url"
        else
            # introduced in git version 1.7.12.2
            set gitRemoteURLcmd "git ls-remote --get-url"
        end
        if not test (git rev-parse HEAD) = (git ls-remote --heads (eval $gitRemoteURLcmd) (git rev-parse --abbrev-ref '@{u}' | sed 's/origin\///g') | cut -f1)
            eval git pull --rebase --stat (git rev-parse --abbrev-ref '@{u}' | sed 's/\// /g')
        end
        cd $origPWD
    else
        echo 'Git required to auto update... bailing.'
        return 1
    end
end

