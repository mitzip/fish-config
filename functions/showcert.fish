function showcert -a host -d "Show SSL cert of remote host"
    openssl s_client -connect $host:443
end
