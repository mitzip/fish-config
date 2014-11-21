function dpaste -a expire syntax -d "Send STDIN to dpaste"
    if test -z expire
        set expire 1
    end
    if test -z syntax
        set syntax 'bash'
    end
    curl -si -F "expiry_days=$expire" -F "syntax=$syntax" -F "content=<-" http://dpaste.com/api/v2/
end
