function gitupall -a 'gitpaths' -d "Run git up on every sub-dir"
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
    set -e origPWD
    set -e gitpaths
    if test $numrepos -eq 0
        echo "WARNING: No git repos found..."
        set -e numrepos
        return 1
    else
        set -e numrepos
        return 0
    end
end
