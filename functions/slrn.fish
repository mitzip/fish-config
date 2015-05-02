function slrn -d 's-lang read news client'
    if which slrn > /dev/null ^ /dev/null
        if test -n $NNTPSERVER
            slrn $argv
        else
            # nice free news server
            env NNTPSERVER='news.aioe.org' slrn $argv
        end
    else
        echo 'Error: slrn not found'
    end
end
