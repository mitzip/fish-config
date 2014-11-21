function gittyup -a 'gitpaths' -d "Run git up on every sub-dir"
    if test -d ~/.local/bin
        if not echo $fish_user_paths | grep "$HOME/\.local/bin" > /dev/null ^ /dev/null
            # If you've got it, use it!
            set --universal fish_user_paths $fish_user_paths ~/.local/bin
        end
    end 
    if not which gitup.py > /dev/null ^ /dev/null
        if which pip > /dev/null ^ /dev/null
            # https://pypi.python.org/pypi/git-up/
            pip install --user git-up
        else
            echo "Can't install git-up without python's pip, bailing..."
            return 1
        end
    end
    set origPWD $PWD
    if test -z $gitpaths
        set gitpaths $origPWD
    else if test ! -d $gitpaths
        echo "ERROR: Cannot find directory '$gitpaths'..."
        return 1
    end
    set gitpaths (echo $gitpaths"/" | tr -s /)
    set numrepos 0
    for i in (command ls $gitpaths)
        if test -d $gitpaths$i
            cd $gitpaths$i
            if test -d .git
                if git branch -a | grep 'remotes/origin' > /dev/null ^ /dev/null 
                    echo $PWD
                    git up
                    echo -ne "\n"
                    set numrepos (math $numrepos+1)
                end
            end
        end
    cd $origPWD
    end
    if test $numrepos -eq 0
        echo "WARNING: No git repos found..."
        return 1
    else
        return 0
    end
end
